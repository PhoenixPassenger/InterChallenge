//
//  PostListViewModelType.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
protocol PostListViewModelType {
    var output: ListViewModelOutput? { get set }
    func titleForPostAt(index: Int) -> String
    func bodyForPostAt(index: Int) -> String
    func idForPostAt(index: Int) -> Int
    func loadPostsBy(userId: Int)
    func numberOfCells(section: Int) -> Int
}
