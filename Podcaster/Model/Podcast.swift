//
//  Podcast.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 12/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation

class Podcast: NSObject, Decodable, NSCoding {

    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
    
    enum Keys: String {
        case trackNameKey
        case artistNameKey
        case artworkURLKey
        case feedKey
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(trackName ?? "", forKey: Keys.trackNameKey.rawValue)
        aCoder.encode(artistName ?? "", forKey: Keys.artistNameKey.rawValue)
        aCoder.encode(artworkUrl600 ?? "", forKey: Keys.artworkURLKey.rawValue)
        aCoder.encode(feedUrl ?? "", forKey: Keys.feedKey.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.trackName = aDecoder.decodeObject(forKey: Keys.trackNameKey.rawValue) as? String
        self.artistName = aDecoder.decodeObject(forKey: Keys.artistNameKey.rawValue) as? String
        self.artworkUrl600 = aDecoder.decodeObject(forKey: Keys.artworkURLKey.rawValue) as? String
        self.feedUrl = aDecoder.decodeObject(forKey: Keys.feedKey.rawValue) as? String
    }

}
