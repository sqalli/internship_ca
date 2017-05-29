//
//  FacebookPickerConfig.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

/// Simple struct to hold settings
public struct FacebookPickerConfig {
    
    /// Sub-stuct holding configuration relevant to UI presentation !
    public struct UIConfig {
        /// Will be applied to the navigation bar
        public var navBarTintColor: UIColor?
        
        /// Will be applied to navigation bar title color
        public var navTitleColor: UIColor?
        
        /// Will be applied to navigation bar tintColor
        public var navTintColor: UIColor?
        
        /// Will be applied to the navigation bar
        public var backgroundColor: UIColor?
        
        /// Will be applied to the navigation bar
        public var closeButtonColor: UIColor?
        
        /// Will be applied to album's title color
        public var albumsTitleColor: UIColor?
        
        /// Will be applied to album's pictures number
        public var albumsCountColor: UIColor?
        
        /// Will be applied to image border when selected
        public var selectedBorderColor: UIColor?
        
        /// Will be applied to image border width when selected
        public var selectedBorderWidth: CGFloat?
    }
    
    /// Will be applied to the album's navigation bar title
    public var title: String = NSLocalizedString("Album(s)",
                                                 comment: "")
    
    // The picture corner radius. Used for display album cover and album's picture.
    public var pictureCornerRadius: CGFloat = 2.0
    
    // Allow multiple pictures selection
    public var allowMultipleSelection: Bool = false
    
    /// UI-specific configuration.
    public var uiConfig = UIConfig()
}
