//
//  AdsHelper.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/17/22.
//

import UIKit
import GoogleMobileAds

public func getBannerAdSize() -> CGSize {
    let deviceTypeAndOrientation = DeviceTypeAndOrientation.get()
    
    // when the device is iPhone and on Portrait mode, set the size to GADAdSizeBanner.size(320x50)
    // when on iPhone Landscape or iPad, set the size to GADAdSizeLeader.board.size(728x90)
    switch deviceTypeAndOrientation {
    case .iPhonePortrait, .iPhoneLandscape, .iPhoneUnknown:
        return GADAdSizeBanner.size
    case .iPadPortrait, .iPadLandscape, .iPadUnknown:
        return GADAdSizeLeaderboard.size
    case .unknown:
        return GADAdSizeBanner.size
    }
}
