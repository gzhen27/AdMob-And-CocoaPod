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
    let rewardedAdUnitID = "ca-app-pub-3940256099942544/1712485313"
    
    @State var showIntersitialAD = false
    @State var showRewardedAd = false
    @State var rewardGranted = false
    


    var body: some View {
        VStack() {
            Spacer()
            rewardAdView
            intersitialAdBtn
            Spacer()
            BannerAdUI(adUnitID: bannerAdUnitID)
        }
        .presentInterstitialAd(isPresented: $showIntersitialAD, adUnitID: interstitialAdUnitID)
        .presentRewardedAd(isPresent: $showRewardedAd, adUnitID: rewardedAdUnitID, rewardFunc: handleReward)
    }
    
    private var intersitialAdBtn: some View {
        Button {
            showIntersitialAD.toggle()
        } label: {
            getTextView(text: "Interstitial Ad")
        }
    }
    
    private var rewardAdView: some View {
        VStack {
            if rewardGranted {
                getTextView(text: "Here is the Gift")
            } else {
                Button {
                    showRewardedAd.toggle()
                } label: {
                    getTextView(text: "Reward Ad")
                }

            }
        }
    }
    
    private func getTextView(text: String) -> some View{
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
                .frame(width: 500, height: 70)
                .foregroundColor(Color(UIColor(named: "BorderColor")!))
            Text(text)
                .font(.system(size: 32))
                .bold()
                .foregroundColor(Color(UIColor(named: "AccentColor")!))
                .padding()
        }
    }
    
    private func handleReward() {
        print("Ad test - Reward Granted")
        rewardGranted.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
