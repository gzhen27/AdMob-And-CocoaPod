//
//  InterstitialAd.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/19/22.
//

import Foundation
import GoogleMobileAds

class InterstitialAd: NSObject {
    var interstitialAd: GADInterstitialAd?
    
    static let shared = InterstitialAd()
    
    func load(withAdUnitID id: String) {
        let req = GADRequest()
        req.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        GADInterstitialAd.load(withAdUnitID: id, request: req) { ad, err in
            if let err = err {
                print("Failed to load interstitial ad with error: \(err.localizedDescription)")
                return
            }
            
            self.interstitialAd = ad
        }
    }
}
