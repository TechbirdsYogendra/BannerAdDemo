//
//  ViewController+BannerAds.swift
//  BannerAdDemo
//
//  Created by Yogendra Singh on 19/02/25.
//
import GoogleMobileAds

extension ViewController {
    func loadBannerAds() {
        let viewWidth = view.frame.inset(by: view.safeAreaInsets).width
        
        // Here the current interface orientation is used. Use
        // GADLandscapeAnchoredAdaptiveBannerAdSizeWithWidth or
        // GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth if you prefer to load an ad of a
        // particular orientation,
        let adaptiveSize = currentOrientationAnchoredAdaptiveBanner(width: viewWidth)
        bannerView = BannerView(adSize: adaptiveSize)
        bannerView.adSize = currentOrientationAnchoredAdaptiveBanner(width: viewWidth)
        // test ca-app-pub-3940256099942544/2435281174
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2435281174"
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(Request())
        
        addBannerViewToView(bannerView)
    }
    
    func addBannerViewToView(_ bannerView: BannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        // This example doesn't give width or height constraints, as the provided
        // ad size gives the banner an intrinsic content size to size the view.
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}

extension ViewController: BannerViewDelegate {
    func bannerViewDidReceiveAd(_ bannerView: BannerView) {
        print("bannerViewDidReceiveAd")
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    func bannerView(_ bannerView: BannerView, didFailToReceiveAdWithError error: Error) {
        print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func bannerViewDidRecordImpression(_ bannerView: BannerView) {
        print("bannerViewDidRecordImpression")
    }
    
    func bannerViewWillPresentScreen(_ bannerView: BannerView) {
        print("bannerViewWillPresentScreen")
    }
    
    func bannerViewWillDismissScreen(_ bannerView: BannerView) {
        print("bannerViewWillDIsmissScreen")
    }
    
    func bannerViewDidDismissScreen(_ bannerView: BannerView) {
        print("bannerViewDidDismissScreen")
    }
}

