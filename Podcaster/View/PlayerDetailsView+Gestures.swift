//
//  PlayerDetailsView+Gestures.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 20/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

extension PlayerDetailsView {
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        if gesture.state == .changed {
            handlePanChanged(gesture: gesture)
            
        } else if gesture.state == .ended {
            handlePanEnded(gesture: gesture)
        }
    }
    
     func handlePanChanged(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.superview)
        self.transform = CGAffineTransform(translationX: 0, y: translation.y)
        
        self.miniPlayerView.alpha = 1 + translation.y / 200
        self.maximizedStackView.alpha = -translation.y / 200
    }
    
    fileprivate func handlePanEnded(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.superview)
        let velocity = gesture.velocity(in: self.superview)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.transform = .identity
            
            if translation.y < 200 || velocity.y < -400{
                UIApplication.maintTabBarController()?.maximizePlayerDetails(episode: nil)
            }
            
            self.miniPlayerView.alpha = 1
            self.maximizedStackView.alpha = 0
        })
    }
    
    @objc func handleTapMaximize() {
        UIApplication.maintTabBarController()?.maximizePlayerDetails(episode: nil)
    }
}
