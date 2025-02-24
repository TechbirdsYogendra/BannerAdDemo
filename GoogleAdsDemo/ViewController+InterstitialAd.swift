//
//  ViewController+InterstitialAd.swift
//  BannerAdDemo
//
//  Created by Yogendra Singh on 19/02/25.
//
import GoogleMobileAds
extension ViewController {
    
    func loadInterstitialAd() {
        Task {
            do {
                let request = Request()
                interstitial = try await InterstitialAd.load(
                    with: "ca-app-pub-3940256099942544/4411468910", request: request)
                interstitial?.fullScreenContentDelegate = self
            } catch {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
            }
        }
    }
    
    func showInterstitialAd() {
        if let interstitial = interstitial {
            interstitial.present(from: self)
        } else {
            print("Ad wasn't ready.")
        }
    }
}

extension ViewController: FullScreenContentDelegate {
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
}
