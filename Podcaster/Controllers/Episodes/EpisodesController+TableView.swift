//
//  EpisodesController+TableView.swift
//  Podcaster
//
//  Created by ivica petrsoric on 25/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

extension EpisodesController {
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 10))
        
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicatorView.color = .purple
        activityIndicatorView.startAnimating()
        
        let searchLabel = UILabel()
        searchLabel.text = "Currently Searching"
        searchLabel.textColor = .purple
        searchLabel.textAlignment = .center
        searchLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let searchStack = UIStackView(arrangedSubviews: [padding, activityIndicatorView, searchLabel])
        searchStack.distribution = .fillEqually
        searchStack.axis = .vertical
        
        return searchStack
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return episodes.isEmpty ? 100 : 0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let downloadAction = UITableViewRowAction(style: .normal, title: "Download") { (_, _) in
            let episopde = self.episodes[indexPath.row]
            UserDefaults.standard.downloadEpisode(episode: episopde)
            
            APIService.shared.downloadEpisode(episode: episopde)
        }
        return [downloadAction]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = self.episodes[indexPath.row]
        let mainTabController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController
        mainTabController?.maximizePlayerDetails(episode: episode, playlistEpisodes: self.episodes)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodeCell
        let episode = episodes[indexPath.row]
        cell.episode = episode
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
}
