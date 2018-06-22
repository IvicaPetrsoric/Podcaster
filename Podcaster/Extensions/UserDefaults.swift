//
//  UserDefaults.swift
//  Podcaster
//
//  Created by ivica petrsoric on 22/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static var favoritedPodcastKey = "favoritedPodcastKey"
    
    func savedPodcasts() -> [Podcast] {
        guard let savedPodcastData = UserDefaults.standard.data(forKey: UserDefaults.favoritedPodcastKey) else { return [] }
        guard let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: savedPodcastData) as? [Podcast] else { return [] }
        return savedPodcasts
    }
    
}
