//
//  FacebookImagePickerDelegate.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

public protocol FacebookImagePickerDelegate: class {
    
    /// Called when image is picked
    ///
    /// - Parameters:
    ///   - imagePicker: the picker controller
    ///   - successImageModels: FacebookImageModel which containt image url, image and image id
    ///   - errorImageModels: FacebookImageModel which cause error
    ///   - errors: with description
    func facebookImagePicker(
        imagePicker: UIViewController,
        successImageModels: [FacebookImage],
        errorImageModels: [FacebookImage],
        errors: [Error?]
    )
    
    /// Called when facebook picker failed
    ///
    /// - Parameters:
    ///   - imagePicker: the picker controller
    ///   - error: with description
    func facebookImagePicker(imagePicker: UIViewController,
                             didFailWithError error: Error?)
    
    /// Called when facebook picker is cancelled without error
    ///
    /// - Parameter imagePicker: the picker controller
    func facebookImagePicker(didCancelled imagePicker: UIViewController)
    
    /// Called when image picker completed dismissing
    func facebookImagePickerDismissed()
}

// Extension to make some method optional...
public extension FacebookImagePickerDelegate {
    func facebookImagePickerDismissed() {
        // Override in your controller to make your own implementation !
    }
    
    func facebookImagePicker(didCancelled imagePicker: UIViewController) {
        // Override in your controller to make your own implementation !
    }
}
