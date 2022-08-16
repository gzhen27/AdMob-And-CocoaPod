//
//  AppTrackingManager.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import AppTrackingTransparency
import AdSupport

struct AppTrackingManager {
    /**
     gets the advertising identifier for a device, returns all zeros in simulator (regardless of any settings).
     */
    static func getIDFA() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    /**
     requests the tracking authorization from the user
     */
    static func checkTrackingStatus(completionHandler: @escaping (ATTrackingManager.AuthorizationStatus) -> Void) {
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                completionHandler(status)
            }
        }
    }
    
    /**
     logs the tracking authorization statu
     */
    static func logTrackingInfo(status: ATTrackingManager.AuthorizationStatus) {
        switch status {
        case .authorized:
            let id = AppTrackingManager.getIDFA()
            print("G - The tracking status is authorized")
            print("G - The advertising identifier is \(id)")
        case .notDetermined:
            print("G - The tracking status is notDetermined")
        case .denied:
            print("G - The tracking status is denied")
        case .restricted:
            print("G - The tracking status is restricted")
        @unknown default:
            break
        }
    }
    
}
