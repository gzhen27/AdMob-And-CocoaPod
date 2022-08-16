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

    var body: some View {
        VStack() {
            Spacer()
            BannerAdUI(adUnitID: bannerAdUnitID)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
