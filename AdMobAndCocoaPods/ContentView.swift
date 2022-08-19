//
//  ContentView.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import SwiftUI

struct ContentView: View {
    // always uses google test ads for testing
    // for more test ads: https://developers.google.com/admob/ios/test-ads
    let bannerAdUnitID = "ca-app-pub-3940256099942544/2934735716"
    let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
    
    @State var showIntersitialAD = false

    var body: some View {
        VStack() {
            Spacer()
            Button {
                showIntersitialAD.toggle()
            } label: {
                Text("Interstitial Ad")
            }

            Spacer()
            BannerAdUI(adUnitID: bannerAdUnitID)
        }
        .presentInterstitialAd(isPresented: $showIntersitialAD, adUnitID: interstitialAdUnitID)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
