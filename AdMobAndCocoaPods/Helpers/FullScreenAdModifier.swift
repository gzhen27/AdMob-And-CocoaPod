//
//  FullScreenAdModifier.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/19/22.
//

import SwiftUI

struct FullScreenAdModifier<Parent: View>: View {
    
    @Binding var isPresented: Bool
    let adType: AdType
    let adUnitID: String
    let parent: Parent
    let rewardFunc: (() -> Void)?
    
    init(isPresented: Binding<Bool>, adType: AdType, adUnitID: String, parent: Parent, rewardFunc: (() -> Void)? = nil) {
        self._isPresented = isPresented
        self.adType = adType
        self.adUnitID = adUnitID
        self.parent = parent
        self.rewardFunc = rewardFunc
    }
    
    enum AdType {
        case interstitial
        case rewarded
    }
    
    var body: some View {
        ZStack {
            parent
            if isPresented {
                switch adType {
                case .interstitial:
                    InterstitialAdView(isPresented: $isPresented, adUnitID: adUnitID)
                case .rewarded:
                    RewardedAdView(isPresented: $isPresented, adUnitID: adUnitID, rewardFunc: rewardFunc)
                }
            }
        }
        .onAppear {
            switch adType {
            case .interstitial:
                InterstitialAd.shared.load(withAdUnitID: adUnitID)
            case .rewarded:
                RewardedAd.shared.load(withAdUnitID: adUnitID)
            }
        }
    }
}


extension View {
    public func presentInterstitialAd(isPresented: Binding<Bool>, adUnitID: String ) -> some View {
        FullScreenAdModifier(isPresented: isPresented, adType: .interstitial, adUnitID: adUnitID, parent: self)
    }
    
    public func presentRewardedAd(isPresent: Binding<Bool>, adUnitID: String, rewardFunc: (() -> Void)?) -> some View {
        FullScreenAdModifier(isPresented: isPresent, adType: .rewarded, adUnitID: adUnitID, parent: self, rewardFunc: rewardFunc)
    }
}
