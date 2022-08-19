//
//  FullScreenAdModifier.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/19/22.
//

import SwiftUI

struct FullScreenAdModifier<Parent: View>: View {
    
    @Binding var isPresented: Bool
    @State var adType: AdType
    var adUnitID: String
    var parent: Parent
    
    enum AdType {
        case interstitial
        case rewarded
    }
    
    var body: some View {
        ZStack {
            parent
            if isPresented {
                if adType == .interstitial {
                    InterstitialAdView(isPresented: $isPresented, adUnitID: adUnitID)
                }
            }
        }
        .onAppear {
            if adType == .interstitial {
                InterstitialAd.shared.load(withAdUnitID: adUnitID)
            }
        }
    }
}


extension View {
    public func presentInterstitialAd(isPresented: Binding<Bool>, adUnitID: String ) -> some View {
        FullScreenAdModifier(isPresented: isPresented, adType: .interstitial, adUnitID: adUnitID, parent: self)
    }
}
