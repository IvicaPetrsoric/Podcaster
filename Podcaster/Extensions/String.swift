//
//  String.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 15/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import Foundation

extension String {
    
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
