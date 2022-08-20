//
//  InterstitialAdView.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/19/22.
//

import SwiftUI
import GoogleMobileAds

final class InterstitialAdView: NSObject, UIViewControllerRepresentable, GADFullScreenContentDelegate {
    let interstitialAd = InterstitialAd.shared.interstitialAd
    
    @Binding var isPresented: Bool
    let adUnitID: String
    
    init(isPresented: Binding<Bool>, adUnitID: String) {
        self._isPresented = isPresented
        self.adUnitID = adUnitID
        
        super.init()
        
        // set InterstitalAdView as the delegate for the ad
        interstitialAd?.fullScreenContentDelegate = self
    }
 
    // creates a swiftUI view from a UIViewController
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIViewController()
        
        // wait 100 milliseconds and display the ad
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.displayAd(from: vc)
        }
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    private func displayAd(from root: UIViewController) {
        if let ad = interstitialAd {
            ad.present(fromRootViewController: root)
        } else {
            print("Ad test - Interstitial Ad is not loaded")
            self.isPresented.toggle()
        }
    }

    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad test - Interstitial Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad test - Interstitial Ad will present full screen content")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad test - Interstitial Ad did dismiss full screen content")
        InterstitialAd.shared.load(withAdUnitID: adUnitID)
        isPresented.toggle()
    }
}
