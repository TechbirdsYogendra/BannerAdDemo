//
//  ViewController.swift
//  BannerAdDemo
//
//  Created by Yogendra Singh on 14/02/25.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController {
    
    var bannerView: BannerView!
    var interstitial: InterstitialAd?
    var adLoader: AdLoader!

    @IBOutlet weak var nativeAdInfo: UILabel!
    @IBOutlet weak var nativeAdImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterstitialAd()
    }
    
    @IBAction func showCustomAdAction(_ sender: UIButton) {
        // loadNativeAds()
        loadVideoAd()
    }
    
    @IBAction func showInterstitialAdAction(_ sender: UIButton) {
        interstitial?.present(from: nil)
    }
    
    @IBAction func showBannerAdAction(_ sender: UIButton) {
        loadBannerAds()
    }
}

