//
//  AdMobAndCocoaPodsApp.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import SwiftUI

@main
struct AdMobAndCocoaPodsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    AppTrackingManager.checkTrackingStatus(completionHandler: AppTrackingManager.logTrackingInfo)
                }
        }
    }
}
