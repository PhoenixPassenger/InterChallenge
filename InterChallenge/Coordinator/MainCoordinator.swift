//
//  MainCoordinator.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 29/08/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let rootViewControoler = UsersListViewController()
        rootViewControoler.title = localizedStrings.challenge.localized
        rootViewControoler.coordinator = self
        rootViewControoler.viewModel = ChallengeViewModel()
        rootViewControoler.viewModel.output = rootViewControoler
        navigationController.pushViewController(rootViewControoler, animated: false)
    }
    
    func postsTable(with userId: Int, by name: String) {
        let vc = PostTableViewController()
        vc.coordinator = self
        vc.viewModel = PostListViewModel()
        vc.viewModel.output = vc
        vc.userId = userId
        vc.userName = name
        navigationController.pushViewController(vc, animated: true)
    }

    func albumsTable(with userId: Int, by name: String) {
        let vc = AlbumTableViewController()
        vc.coordinator = self
        vc.viewModel = AlbumListViewModel()
        vc.viewModel.output = vc
        vc.userId = userId
        vc.userName = name
        navigationController.pushViewController(vc, animated: true)
    }
    
    func postsToComments(with postId: Int, by username: String) {
        let vc = CommentTableViewController()
        vc.coordinator = self
        vc.viewModel = CommentListViewModel()
        vc.viewModel.output = vc
        vc.postId = postId
        vc.userName = username
        navigationController.pushViewController(vc, animated: true)
    }
    
    func albumToPhoto(with albumId: Int, by username: String) {
        let vc = PhotoTableViewController()
        vc.coordinator = self
        vc.viewModel = PhotoListViewModel()
        vc.viewModel.output = vc
        vc.albumId = albumId
        vc.userName = username
        navigationController.pushViewController(vc, animated: true)
    }
    
    func photoToDetails(with title: String, by image: UIImage){
        let vc = DetailsViewController()
        vc.coordinator = self
        vc.name = title
        vc.photo = image
        navigationController.pushViewController(vc, animated: true)
    }
}
