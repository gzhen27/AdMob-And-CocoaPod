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
                    updateFrame()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                    updateFrame()
                }
        }
    }

    private func updateFrame() {
        let deviceTypeAndOrientation = DeviceTypeAndOrientation.get()
        
        // when the device is iPhone and on Portrait mode, set the size to GADAdSizeBanner.size(320x50)
        // when on iPhone Landscape or iPad, set the size to GADAdSizeLeader.board.size(728x90)
        switch deviceTypeAndOrientation {
        case .iPhonePortrait, .iPhoneLandscape, .iPhoneUnknown:
            adSize = GADAdSizeBanner.size
        case .iPadPortrait, .iPadLandscape, .iPadUnknown:
            adSize = GADAdSizeLeaderboard.size
        case .unknown:
            adSize = GADAdSizeBanner.size
        }
    }
}
