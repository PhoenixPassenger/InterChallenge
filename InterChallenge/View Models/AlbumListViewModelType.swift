//
//  AlbumListViewModelType.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
protocol AlbumListViewModelType {
    var output: ListViewModelOutput? { get set }
    func titleForAlbumAt(index: Int) -> String
    func idForAlbumAt(index: Int) -> Int
    func loadAlbumsBy(userId: Int)
    func numberOfCells(section: Int) -> Int
}
