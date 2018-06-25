//
//  SearchResults.swift
//  Podcaster
//
//  Created by ivica petrsoric on 25/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    
    let resultCount: Int
    let results: [Podcast]
    
}
