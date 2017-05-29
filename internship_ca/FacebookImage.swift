//
//  FacebookImage.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

public class FacebookImage {
    
    // MARK: - Var
    /// The image, not nil only if image is selected
    public var image: UIImage?
    
    /// Normal size picture url
    public var normalSizeUrl: String?
    
    /// Full size source picture url
    public var fullSizeUrl: String?
    
    /// Picture id
    public var imageId: String?
    
    // MARK: - Init
    /// Initialize Image model from informations retrieve from the graph API
    ///
    /// - Parameters:
    ///   - picture: the image string url for the default size
    ///   - imgId: the image id
    ///   - source: the image string url for the full size
    init(picture: String, imgId: String, source: String) {
        self.imageId = imgId
        self.normalSizeUrl = picture
        self.fullSizeUrl = source
    }
}
