//
//  CMTime.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 18/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatSring = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatSring
    }
}
