//
//  ViewController.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 11/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .purple
        
        setuViewControllers()
        
    }
    
    fileprivate func setuViewControllers() {
        viewControllers = [
            generateNavigationController(with: ViewController(), title: "Favorite", image: #imageLiteral(resourceName: "favorites")),
            generateNavigationController(with: ViewController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateNavigationController(with: ViewController(), title: "Download", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    // MARK:- Helper function
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }



}

