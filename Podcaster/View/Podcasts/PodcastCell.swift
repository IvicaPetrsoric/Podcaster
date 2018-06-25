//
//  PodcastCell.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 12/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImageView: CustomImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            podcastImageView.progressIndicatorShouldAnimate(animate: true)
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            podcastImageView.sd_setImage(with: url) { (_, _, _, _) in
                self.podcastImageView.progressIndicatorShouldAnimate(animate: false)
            }
        }
    }
}
