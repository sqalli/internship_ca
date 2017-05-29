//
//  FacebookNavigationController.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class FacebookNavigationController: UINavigationController {
    
    // MARK: - Lifecycle
    /// Initialize the navigation controller after didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply barTintColor if specified in config struct
        if let barTintColor = FacebookImagePicker.pickerConfig.uiConfig.navBarTintColor {
            self.navigationBar.barTintColor = barTintColor
        }
        
        // Apply tintColor if specified in config struct
        if let tintColor = FacebookImagePicker.pickerConfig.uiConfig.navTintColor {
            self.navigationBar.tintColor = tintColor
        }
        
        // Apply navigation bar title color if specified in config struct
        if let tintColor = FacebookImagePicker.pickerConfig.uiConfig.navTitleColor {
            self.navigationBar.titleTextAttributes = [
                NSForegroundColorAttributeName: tintColor
            ]
        }
    }
}
