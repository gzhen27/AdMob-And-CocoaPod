//
//  BannerAdViewController.swift
//  AdMobAndCocoaPods
//
//  Created by G Zhen on 8/16/22.
//

import UIKit
import GoogleMobileAds

class BannerAdViewController: UIViewController {
    let adUnitID: String
    
    // creates a view for banner ad
    // for more detail: https://developers.google.com/admob/ios/banner
    var bannerView = GADBannerView()
    
    init(adUnitID: String) {
        self.adUnitID = adUnitID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lifecycles
    override func viewDidLoad() {
        // configure GADBannerView properties
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = self
        
        loadAd()

        // adds the bannerView as a subview to the current view
        view.addSubview(bannerView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.loadAd()
    }
    
    private func loadAd() {
        let deviceTypeAndOrientation = DeviceTypeAndOrientation.get()
        
        // when the device is iPhone and on Portrait mode, set the size to GADAdSizeBanner.size(320x50)
        // when on iPhone Landscape or iPad, set the size to GADAdSizeLeader.board.size(728x90)
        switch deviceTypeAndOrientation {
        case .iPhonePortrait, .iPhoneLandscape, .iPhoneUnknown:
            bannerView.adSize = GADAdSizeBanner
        case .iPadPortrait, .iPadLandscape, .iPadUnknown:
            bannerView.adSize = GADAdSizeLeaderboard
        case .unknown:
            bannerView.adSize = GADAdSizeBanner
        }
        
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        bannerView.load(request)
    }
}
