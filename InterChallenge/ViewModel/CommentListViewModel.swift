//
//  CommentListViewModel.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
final class CommentListViewModel {
    public weak var output: ListViewModelOutput?
    
    var comments = [Comment]()
    func loadCommentsBy(postId: Int){
        ServiceLayer.request(router: .getCommentsByPosts(postId: postId)) { [weak self] (result: Result<[Comment], Error>) in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
                
            case .success(let comments):
                self.comments = comments
                DispatchQueue.main.async {
                    self.output?.needToReload()
                }
            }
        }
    }
}

extension CommentListViewModel: CommentListViewModelType {
    func idForCommentAt(index: Int) -> Int {
        return comments[index].id
    }
    
    func nameForCommentAt(index: Int) -> String {
        return comments[index].name
    }
    
    func bodyForCommentAt(index: Int) -> String {
        return comments[index].body
    }
    
    func numberOfCells(section: Int) -> Int {
        return comments.count
    }
}
