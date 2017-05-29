//
//  AssetManager.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

public class AssetManager {
    
    /// Get image from bundle
    ///
    /// - parameter name: name of the image
    ///
    /// - returns: return the retrieved image
    public static func getImage(name: String) -> UIImage? {
        
        // Retrieved the main bundle
        var bundle = Bundle(for: AssetManager.self)
        if let bundlePath = bundle.resourcePath?.appending("/FacebookImagePicker.bundle"),
            let ressourceBundle = Bundle(path: bundlePath) {
            
            // Bundle with the new path
            bundle = ressourceBundle
        }
        
        // Return the bundle image
        return UIImage(named: name, in: bundle, compatibleWith: nil) ?? UIImage()
    }
}
