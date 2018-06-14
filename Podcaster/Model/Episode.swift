//
//  Episode.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 14/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    
    let title: String
    let pubDate: Date
    let description: String
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.description = feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
