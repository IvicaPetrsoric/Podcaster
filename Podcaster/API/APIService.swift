//
//  APIService.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 12/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit


class APIService {
    
    typealias EpisodeDownloadedCompleteTuple = (fileUrl: String, episodeTitle: String)
    typealias PodcastDownloadCompleteTuple = (podcasts: [Podcast], noWebConnection: Bool)
    
    private let baseURL = "https://itunes.apple.com/search"
    static let shared = APIService()
    
    
    func downloadEpisode(episode: Episode) {
        let downloadRequest = DownloadRequest.suggestedDownloadDestination()
        
        Alamofire.download(episode.streamUrl, to: downloadRequest).downloadProgress { (progress) in
            NotificationCenter.default.post(name: .downloadProgress, object: nil, userInfo: ["title": episode.title, "progress": progress.fractionCompleted])
            
            }.response { (resp) in
                let episodeDownloaadComplete = EpisodeDownloadedCompleteTuple(fileUrl: resp.destinationURL?.absoluteString ?? "", episode.title)
                NotificationCenter.default.post(name: .downloadedCompleate, object: episodeDownloaadComplete, userInfo: nil)
                
                var downloadedEpisodes = UserDefaults.standard.downloadedEpisodes()
                guard let index = downloadedEpisodes.index(where: { $0.title == episode.title && $0.author == episode.author }) else { return }
                downloadedEpisodes[index].fileUrl = resp.destinationURL?.absoluteString ?? ""
                
                do {
                    let data = try JSONEncoder().encode(downloadedEpisodes)
                    UserDefaults.standard.set(data, forKey: UserDefaults.downloadedEpisodesKey)
                } catch let err {
                    print("Failed to encode downloaded episodes with file url updarte:", err)
                }
        }
    }
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping ([Episode]) -> ()) {
        guard let url = URL(string: feedUrl.toSecureHTTPS()) else { return }
        
        DispatchQueue.global(qos: .background).async {
            let parser = FeedParser(URL: url)
            parser?.parseAsync(result: { (result) in
                
                if let err = result.error {
                    print("Failed to parse XML feed:",err)
                    return
                }
                
                guard let feed = result.rssFeed else { return }
                let episodes = feed.toEpisodes()
                
                completionHandler(episodes)
            })
        }
    }
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping (PodcastDownloadCompleteTuple) -> ()) {
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(baseURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            var podcastDownloaadComplete = PodcastDownloadCompleteTuple([], false)

            if let err = dataResponse.error {
                print("Failed to contact yahoo", err)
                podcastDownloaadComplete.noWebConnection = true
                completionHandler(podcastDownloaadComplete)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                podcastDownloaadComplete.podcasts = searchResult.results
                completionHandler(podcastDownloaadComplete)

            } catch let err {
                print("Failed to decode:",err)
            }
        }
    }

}
