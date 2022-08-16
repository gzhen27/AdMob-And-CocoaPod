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
        
        // adds the bannerView as a subview to the current view
        view.addSubview(bannerView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadAd()
    }
    
    private func loadAd() {
        let frame = view.frame.inset(by: view.safeAreaInsets)
        let width = frame.size.width
        
        // get adaptive GADAdsize and set the ad view
        // for more detail: https://developers.google.com/admob/ios/banner/anchored-adaptive
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(width)
        
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        bannerView.load(request)
    }
}
