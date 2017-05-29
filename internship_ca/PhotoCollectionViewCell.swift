//
//  PhotoCollectionViewCell.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    /// The album cover photo
    fileprivate var albumImageView: ImageAsyncViewLoading?
    
    /// Selection hover view
    fileprivate let selectView = SelectedView()
    
    /// Override the initializer
    ///
    /// - Parameter frame: the new frame of the cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Cell background
        self.backgroundColor = FacebookImagePicker.pickerConfig.uiConfig.backgroundColor
        
        // Picture contener
        self.albumImageView = ImageAsyncViewLoading(frame: CGRect(x: 0,
                                                                     y: 0,
                                                                     width: 80,
                                                                     height: 80))
        self.albumImageView?.contentMode = .scaleAspectFill
        self.albumImageView?.clipsToBounds = true
        self.albumImageView?.layer.cornerRadius = FacebookImagePicker.pickerConfig.pictureCornerRadius
        if let imgView = self.albumImageView {
            self.contentView.addSubview(imgView)
        }
        
        // Selected view
        self.selectView.frame = self.bounds
        self.selectView.autoresizingMask = [.flexibleWidth,
                                            .flexibleHeight]
        self.contentView.addSubview(self.selectView)
        
        // Selected state
        self.isSelected = false
    }
    
    /// Configure collection cell with image
    ///
    /// - Parameter picture: Facebook's image model
    func configure(picture: FacebookImage) {
        
        // Set picture's url
        if let urlPath = picture.normalSizeUrl,
            let url = URL(string: urlPath) {
            self.albumImageView?.imageUrl = url
        }
    }
    
    /// Required init for deserialization
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            self.selectView.isHidden = !super.isSelected
        }
    }
}
