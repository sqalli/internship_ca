//
//  AlbumTableViewCell.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - Var
    /// Album's cover image views
    fileprivate var photoImageView: ImageAsyncViewLoading?
    
    /// Width of the album's cover
    fileprivate let imageWidth = 70
    
    /// Height of the album's cover
    fileprivate let imageHeight = 70
    
    // MARK: - Init
    /// Initialize the cell
    ///
    /// - Parameters:
    ///   - style: the style of the cell (subtitle for this case)
    ///   - reuseIdentifier: the reuse identifier of the cell
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle,
                   reuseIdentifier: reuseIdentifier)
        
        // Common init
        self.backgroundColor = FacebookImagePicker.pickerConfig.uiConfig.backgroundColor
        self.accessoryType = .disclosureIndicator
        
        // Album cover image
        self.photoImageView = ImageAsyncViewLoading(frame: CGRect(x: 15,
                                                                     y: 10,
                                                                     width: imageWidth,
                                                                     height: imageHeight))
        self.photoImageView?.contentMode = .scaleAspectFill
        self.photoImageView?.clipsToBounds = true
        self.photoImageView?.layer.cornerRadius = FacebookImagePicker.pickerConfig.pictureCornerRadius
        if let imgView = self.photoImageView {
            self.contentView.addSubview(imgView)
        }
        
        // Label
        self.textLabel?.textColor = FacebookImagePicker.pickerConfig.uiConfig.albumsTitleColor ?? .black
        self.detailTextLabel?.textColor = FacebookImagePicker.pickerConfig.uiConfig.albumsCountColor ?? .black
    }
    
    /// Required for deserialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Define the layout of the album name label and number of picture label
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // The cell width
        let cellWidth: Int = Int(self.frame.size.width)
        
        // Album's title
        self.textLabel?.frame = CGRect(x: imageWidth + 30,
                                       y: 30,
                                       width: cellWidth - (imageWidth * 2),
                                       height: 20)
        
        // Number of photos in the album
        self.detailTextLabel?.frame = CGRect(x: imageWidth + 30,
                                             y: 50,
                                             width: cellWidth - (imageWidth * 2),
                                             height: 20)
    }
    
    // MARK: - Configure
    /// Configure the cell with Facebook's album
    ///
    /// - Parameter album: Album model which contain album information
    func configure(album: FacebookAlbum) {
        // Album title
        self.textLabel?.text = album.name ?? ""
        
        // Album's pictures count
        self.detailTextLabel?.text = "\(album.count ?? 0)"
        
        // Album cover image
        if let url = album.coverUrl {
            self.photoImageView?.imageUrl = url
        }
    }
    
}
