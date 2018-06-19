//
//  UIApplication.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 20/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

extension UIApplication {
    
    static func maintTabBarController() -> MainTabBarController? {
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
    
}
