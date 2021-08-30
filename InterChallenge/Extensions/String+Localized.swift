//
//  String+Localized.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 29/08/21.
//

import Foundation
extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
protocol Localizable {
    var localized: String { get }
}
// 1
extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return rawValue.localized()
    }
}
enum localizedStrings: String, Localizable {
    case challenge = "Challenge"
    case details = "Details"
    case posts = "Posts"
    case photos = "Photos"
    case album = "Album"
    
    case postsBy = "PostsBy"
    case commentsBy = "CommentsBy"
    case photosBy = "PhotosBy"
    case albumsBy = "AlbumsBy"
    
    case albumsButton = "AlbumsButton"
    case postsButton = "PostsButton"
}
