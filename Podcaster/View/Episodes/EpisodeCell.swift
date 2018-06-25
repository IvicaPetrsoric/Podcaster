//
//  EpisodeCell.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 14/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit
import SDWebImage

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var episodeImageView: CustomImageView!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var pubDateLabel: UILabel!
    
    var episode: Episode! {
        didSet {
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            episodeImageView.progressIndicatorShouldAnimate(animate: true)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
            
            let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "")
            episodeImageView.sd_setImage(with: url) { (_, _, _, _) in
                self.episodeImageView.progressIndicatorShouldAnimate(animate: false)
            }
        }
    }
    
}
