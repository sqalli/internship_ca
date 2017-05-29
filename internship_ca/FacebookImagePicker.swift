//
//  FacebookImagePicker.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

public class FacebookImagePicker: NSObject {
    
    // Picker configuration settings
    open static var pickerConfig = FacebookPickerConfig()
    
    /// Present album picker
    ///
    /// - Parameters:
    ///   - from: controller where we want present the picker
    ///   - delegate: delegate for FacebookImagePickerDelegate
    public final func presentFacebookAlbumImagePicker(from: UIViewController,
                                                      delegate: FacebookImagePickerDelegate) {
        
        // Create album picker
        let albumPicker = FacebookAlbumPicker()
        albumPicker.delegate = delegate
        
        // Embed in navigation controller
        let navi = FacebookNavigationController(rootViewController: albumPicker)
        
        // Present the picker
        from.present(navi, animated: true)
    }
    
}
