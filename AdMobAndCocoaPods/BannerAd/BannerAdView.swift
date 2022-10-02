//
//  BannerAdView.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import SwiftUI

// conforms the BannerAdView to UIViewControllerRepresentable,
// which to create and manage a UIViewController object in SwiftUI interface.
struct BannerAdView: UIViewControllerRepresentable {
    let adUnitID: String
    
    init(adUnitID: String) {
        self.adUnitID = adUnitID
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        BannerAdViewController(adUnitID: adUnitID)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
