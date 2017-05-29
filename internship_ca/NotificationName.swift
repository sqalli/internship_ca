//
//  NotificationName.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 29/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

/// Custom notification identifier
///
/// GBHFacebookImagePickerDidRetrieveAlbum : When album did finish loading
/// GBHFacebookImagePickerDidRetriveAlbumPicture : When album's picture did finish loading
extension Notification.Name {
    static let ImagePickerDidRetrieveAlbum = Notification.Name("FacebookImagePickerDidRetrieveAlbum")
    static let ImagePickerDidRetriveAlbumPicture = Notification.Name("FacebookImagePickerDidRetriveAlbumPicture")
}
