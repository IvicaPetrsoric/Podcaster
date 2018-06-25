//
//  FavoritePodcastCell.swift
//  Podcaster
//
//  Created by ivica petrsoric on 21/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

class FavoritePodcastCell: BaseCell {
    
    var podcast: Podcast! {
        didSet {
            nameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            imageView.progressIndicatorShouldAnimate(animate: true)
            
            let url = URL(string: podcast.artworkUrl600 ?? "")
            imageView.sd_setImage(with: url) { (_, _, _, _) in
                self.imageView.progressIndicatorShouldAnimate(animate: false)
            }
        }
    }
    
    lazy var imageView: CustomImageView = {
        let iv = CustomImageView(image: #imageLiteral(resourceName: "appicon"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Podcast name"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()

    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override func setupCell() {
        setupViews()
    }
    
    fileprivate func setupViews() {
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, artistNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
