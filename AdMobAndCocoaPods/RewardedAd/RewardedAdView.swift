//
//  RewardedAdView.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/19/22.
//

import SwiftUI
import GoogleMobileAds

final class RewardedAdView: NSObject, UIViewControllerRepresentable, GADFullScreenContentDelegate {
    let rewardedAd = RewardedAd.shared.rewardedAd
    
    @Binding var isPresented: Bool
    let adUnitID: String
    let rewardFunc: () -> Void
    
    init(isPresented: Binding<Bool>, adUnitID: String, rewardFunc: @escaping () -> Void) {
        self._isPresented = isPresented
        self.adUnitID = adUnitID
        self.rewardFunc = rewardFunc
        
        super.init()
        
        // set RewardedAdView as the delegate for the ad
        rewardedAd?.fullScreenContentDelegate = self
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIViewController()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.displayAd(from: vc)
        }
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    private func displayAd(from root: UIViewController) {
        if let ad = rewardedAd {
            ad.present(fromRootViewController: root) {
                // calls reward function here
            }
        } else {
            print("G - Rewarded Ad is not loaded")
            self.isPresented.toggle()
        }
    }
    

    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad test - Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad test - Ad will present full screen content")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad test - Ad did dismiss full screen content")
        RewardedAd.shared.load(withAdUnitID: adUnitID)
        isPresented.toggle()
    }
}
