//
//  Podcast.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 12/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
