//
//  FavoriteHeaderCell.swift
//  Podcaster
//
//  Created by ivica petrsoric on 25/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

class FavoriteHeaderCell: BaseCell {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Your Favorite Podcasts"
        label.textColor = .purple
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupCell() {
        addSubview(headerLabel)
        
        headerLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
