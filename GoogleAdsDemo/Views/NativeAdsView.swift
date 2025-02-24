//
//  NativeAdsView.swift
//  BannerAdDemo
//
//  Created by Yogendra Singh on 24/02/25.
//

import UIKit
import GoogleMobileAds

struct NativeAdsViewModel {
    let image: UIImage?
    let title: String
    let description: String
}

class NativeAdsView: UIView {

    @IBOutlet weak var videoView: MediaView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func populateData(model: NativeAdsViewModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    @IBAction func closeAdAction(_ sender: UIButton) {
        removeFromSuperview()
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
