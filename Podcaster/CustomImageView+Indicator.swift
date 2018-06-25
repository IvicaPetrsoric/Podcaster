//
//  CustomImageView+Indicator.swift
//  Podcaster
//
//  Created by ivica petrsoric on 25/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {
    
    lazy var progressIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.color = .purple
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(progressIndicator)
        
        progressIndicator.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        progressIndicator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        progressIndicator.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        progressIndicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func progressIndicatorShouldAnimate(animate: Bool) {
        if animate {
            progressIndicator.startAnimating()
        } else {
            progressIndicator.stopAnimating()
        }
    }
    
}
