//
//  BannerAdUI.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import SwiftUI
import GoogleMobileAds

struct BannerAdUI: View {
    @State private var adSize: CGSize = .zero
    let adUnitID: String
    
    var body: some View {
        VStack(alignment: .center) {
            BannerAdView(adUnitID: adUnitID)
                .frame(width: adSize.width, height: adSize.height)
                .onAppear {
                    adSize = getBannerAdSize()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    adSize = getBannerAdSize()
                }
        }
    }
}
