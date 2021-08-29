//
//  PostListViewModel.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
final class PostListViewModel {
    public weak var output: ListViewModelOutput?
    
    var posts = [Post]()
    func loadPostsBy(userId: Int){
        ServiceLayer.request(router: .getPostsByUser(userId: userId)) { [weak self] (result: Result<[Post], Error>) in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
                
            case .success(let posts):
                self.posts = posts
                DispatchQueue.main.async {
                    self.output?.needToReload()
                }
            }
        }
    }
}

extension PostListViewModel: PostListViewModelType {
    func idForPostAt(index: Int) -> Int {
        return posts[index].id
    }
    
    func titleForPostAt(index: Int) -> String {
        return posts[index].title
    }
    
    func bodyForPostAt(index: Int) -> String {
        return posts[index].body
    }
    
    func numberOfCells(section: Int) -> Int {
        return posts.count
    }
}
