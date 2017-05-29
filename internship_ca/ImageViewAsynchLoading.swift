//
//  ImageViewAsynchLoading.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class ImageAsyncViewLoading: UIImageView {
    
    /// The image URL
    var imageUrl: URL? {
        didSet {
            // Set default image
            self.image = AssetManager.getImage(name: "FacebookImagePickerDefaultImageLoading")
            
            if let url = imageUrl {
                // Start url loading
                URLSession.shared.dataTask(with: url as URL) { data, response, error in
                    // In error
                    guard let data = data, error == nil else {
                        print("\nerror on download \(String(describing: error))")
                        return
                    }
                    
                    // Check success code (200)
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                        print("statusCode != 200; \(httpResponse.statusCode)")
                        return
                    }
                    
                    // Set image
                    DispatchQueue.main.async {
                        // Display image !
                        if let downloadedImage = UIImage(data: data) {
                            self.setImageWithAnimation(image: downloadedImage)
                        }
                    }
                    
                    // resume task
                    }.resume()
            }
        }
    }
    
    /// Set the image with animation
    ///
    /// - Parameter image: the image to set
    fileprivate func setImageWithAnimation(image: UIImage) {
        
        // Set initial state
        self.image = image
        self.alpha = 0
        
        // Start animation to final state
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        self.alpha = 1.0
        }, completion: nil)
    }
}
