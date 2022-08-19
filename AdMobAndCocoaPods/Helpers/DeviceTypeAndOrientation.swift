//
//  DeviceTypeAndOrientation.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/17/22.
//

import UIKit

/**
 finds the interface type and orientation for the current device
 */
enum DeviceTypeAndOrientation {
    
    //extends the cases when needed
    case iPhonePortrait
    case iPhoneLandscape
    case iPhoneUnknown
    case iPadPortrait
    case iPadLandscape
    case iPadUnknown
    case unknown
    
    static func get() -> DeviceTypeAndOrientation {
        let orientation = UIDevice.current.orientation
        let userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        
        switch (orientation, userInterfaceIdiom) {
        case let (x, y) where x.isPortrait && y == .phone:
            return .iPhonePortrait
        case let (x, y) where x.isLandscape && y == .phone:
            return .iPhoneLandscape
        case let (x, y) where x.rawValue == 0 && y == .phone:
            return .iPhoneUnknown
        case let (x, y) where x.isPortrait && y == .pad:
            return .iPadPortrait
        case let (x, y) where x.isLandscape && y == .pad:
            return .iPadLandscape
        case let (x, y) where x.rawValue == 0 && y == .pad:
            return .iPadUnknown
        default:
            return .unknown
        }
    }
}
