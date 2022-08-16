//
//  AdMobAndCocoaPodsApp.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import SwiftUI
import GoogleMobileAds

@main
struct AdMobAndCocoaPodsApp: App {
    
    // uses init() instead of ApplicationDidFinishLaunchWithOptions
    init() {
        // initialize the Mobile Ads SDK
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        print("G - The Mobile Ads SDK is initialized")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    AppTrackingManager.checkTrackingStatus(completionHandler: AppTrackingManager.logTrackingInfo)
                }
        }
    }
}
