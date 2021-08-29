//
//  PhotoListViewModelType.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import UIKit
protocol PhotoListViewModelType {
    var output: PhotoListViewModelOutput? { get set }
    func titleForPhotoAt(index: Int) -> String
    func imageForPhotoAt(index: Int)
    func thumbnailImageForPhotoAt(index: Int)
    func imageForPhotoCellAt(index: Int) -> UIImage?
    func thumbnailImageForPhotoCellAt(index: Int) -> UIImage?
    func loadPhotosBy(albumId: Int)
    func numberOfCells(section: Int) -> Int
}
