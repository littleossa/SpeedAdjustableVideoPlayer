//
//  PlaySpeed.swift
//  VideoPlayerPractice
//
//  Created by littleossa on 2022/08/19.
//

import Foundation

enum PlaySpeed: String, CaseIterable, Identifiable {
    case x0_25 = "0.25倍速"
    case x0_5 = "0.5倍速"
    case x0_75 = "0.75倍速"
    case x1 = "標準"
    case x1_25 = "1.25倍速"
    case x1_5 = "1.5倍速"
    case x1_75 = "1.75倍速"
    
    var id: String { rawValue }
    
    var rate: Float {
        switch self {
        case .x0_25:
            return 0.25
        case .x0_5:
            return 0.5
        case .x0_75:
            return 0.75
        case .x1:
            return 1
        case .x1_25:
            return 1.25
        case .x1_5:
            return 1.5
        case .x1_75:
            return 1.75
        }
    }
    
    var displayTitle: String {
        return "再生速度・" + self.rawValue
    }
}
