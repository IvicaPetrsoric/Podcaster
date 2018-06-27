//
//  PodcastSearchController+SearchBar.swift
//  Podcaster
//
//  Created by ivica petrsoric on 25/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

extension PodcastSearchController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (timer) in
            APIService.shared.fetchPodcasts(searchText: searchText) { (result) in
                if result.noWebConnection {
                    self.showAllert(message: .errorWebConnection)
                    return
                }
                self.podcasts = result.podcasts
                self.tableView.reloadData()
            }
        })
    }
    
}
