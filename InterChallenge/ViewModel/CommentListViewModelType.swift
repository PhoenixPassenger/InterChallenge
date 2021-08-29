//
//  CommentListViewModelType.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
protocol CommentListViewModelType {
    var output: ListViewModelOutput? { get set }
    func nameForCommentAt(index: Int) -> String
    func bodyForCommentAt(index: Int) -> String
    func idForCommentAt(index: Int) -> Int
    func loadCommentsBy(postId: Int)
    func numberOfCells(section: Int) -> Int
}
