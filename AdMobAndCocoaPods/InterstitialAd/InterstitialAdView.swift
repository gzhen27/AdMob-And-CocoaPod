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
    var adUnitID: String
    
    init(isPresented: Binding<Bool>, adUnitID: String) {
        self._isPresented = isPresented
        self.adUnitID = adUnitID
        super.init()
    }
 
    // creates a swiftUI view from a UIViewController
    func makeUIViewController(context: Context) -> UIViewController {
        let view = UIViewController()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            self.displayAd(from: view)
        }
        
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    private func displayAd(from root: UIViewController) {
        if let ad = interstitialAd {
            ad.present(fromRootViewController: root)
        } else {
            print("G - Ad is loading")
            self.isPresented.toggle()
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        InterstitialAd.shared.load(withAdUnitID: self.adUnitID)
        
        isPresented.toggle()
    }
}
