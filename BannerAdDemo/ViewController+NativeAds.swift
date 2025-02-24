//
//  ViewController+NativeAds.swift
//  BannerAdDemo
//
//  Created by Yogendra Singh on 19/02/25.
//

import GoogleMobileAds

extension ViewController {
    func loadNativeAds() {
        let multipleAdOptions = MultipleAdsAdLoaderOptions()
        multipleAdOptions.numberOfAds = 1 // 5
        adLoader = AdLoader(adUnitID: "ca-app-pub-3940256099942544/3986624511",
                            rootViewController: self,
                            adTypes: [ .native ],
                            options: [ multipleAdOptions ])
        
        adLoader.delegate = self
        adLoader.load(Request())
    }
    
    func loadVideoAd() {
        let videoOptions = VideoOptions()
        videoOptions.areCustomControlsRequested = true
        adLoader = AdLoader(
            adUnitID: "ca-app-pub-3940256099942544/2521693316",
            rootViewController: self,
            adTypes: [.native],
            options: [videoOptions])
        adLoader?.delegate = self
        adLoader?.load(Request())
    }
}

extension ViewController: NativeAdLoaderDelegate {
    func adLoader(_ adLoader: AdLoader, didReceive nativeAd: NativeAd) {
        print("didReceive nativeAd")
        let myCustomView: NativeAdsView = .fromNib()
        myCustomView.frame = view.bounds
        view.addSubview(myCustomView)
        if nativeAd.mediaContent.hasVideoContent {
            nativeAd.mediaContent.videoController.delegate = self
            myCustomView.videoView.mediaContent = nativeAd.mediaContent
        }
        myCustomView.populateData(model: NativeAdsViewModel(image: nativeAd.icon?.image, title: nativeAd.headline ?? "", description: nativeAd.body ?? ""))

    }
    
    func adLoaderDidFinishLoading(_ adLoader: AdLoader) {
        print("adLoaderDidFinishLoading")
    }
    
    func adLoader(_ adLoader: AdLoader, didFailToReceiveAdWithError error: any Error) {
        print("didFailToReceiveAdWithError")
    }
    
    
    func nativeAdDidRecordImpression(_ nativeAd: NativeAd) {
      // The native ad was shown.
    }

    func nativeAdDidRecordClick(_ nativeAd: NativeAd) {
      // The native ad was clicked on.
    }

    func nativeAdWillPresentScreen(_ nativeAd: NativeAd) {
      // The native ad will present a full screen view.
    }

    func nativeAdWillDismissScreen(_ nativeAd: NativeAd) {
      // The native ad will dismiss a full screen view.
    }

    func nativeAdDidDismissScreen(_ nativeAd: NativeAd) {
      // The native ad did dismiss a full screen view.
    }

    func nativeAdWillLeaveApplication(_ nativeAd: NativeAd) {
      // The native ad will cause the app to become inactive and
      // open a new app.
    }
    
}

extension ViewController: VideoControllerDelegate {
    // GADVideoControllerDelegate methods
    func videoControllerDidPlayVideo(_ videoController: VideoController) {
        // Implement this method to receive a notification when the video controller
        // begins playing the ad.
      }

    func videoControllerDidPauseVideo(_ videoController: VideoController) {
        // Implement this method to receive a notification when the video controller
        // pauses the ad.
      }

    func videoControllerDidEndVideoPlayback(_ videoController: VideoController) {
        // Implement this method to receive a notification when the video controller
        // stops playing the ad.
      }

    func videoControllerDidMuteVideo(_ videoController: VideoController) {
        // Implement this method to receive a notification when the video controller
        // mutes the ad.
      }

    func videoControllerDidUnmuteVideo(_ videoController: VideoController) {
        // Implement this method to receive a notification when the video controller
        // unmutes the ad.
      }
}
