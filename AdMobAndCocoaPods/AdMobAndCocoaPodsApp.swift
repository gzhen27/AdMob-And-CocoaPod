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
                    print("G - called when did become active")
                    AppTrackingManager.checkTrackingStatus { status in
                        switch status {
                        case .authorized:
                            let id = AppTrackingManager.getIDFA()
                            print("G - \(id)")
                        case .notDetermined:
                            print("G - notDetermined")
                        case .denied:
                            print("G - denied")
                        case .restricted:
                            print("G - restricted")
                        @unknown default:
                            break
                        }
                    }
                }
        }
    }
}
