//
//  SelectedView.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class SelectedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Border width
        let borderWidth = FacebookImagePicker.pickerConfig.uiConfig.selectedBorderWidth
        self.layer.borderWidth = borderWidth ?? 3.0
        
        // Apply border color
        let defaultColor = FacebookImagePicker.pickerConfig.uiConfig.selectedBorderColor?.cgColor
        self.layer.borderColor = defaultColor ?? UIColor.blue.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
