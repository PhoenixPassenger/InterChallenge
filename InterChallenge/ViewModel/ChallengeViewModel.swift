//
//  ChallengePresenter.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
final class ChallengeViewModel {
    public weak var output: ListViewModelOutput?
    
    var users = [User]()
    func loadUsers(){
        ServiceLayer.request(router: .getUsers) { [weak self] (result: Result<[User], Error>) in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
                
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    self.output?.needToReload()
                }
            }
        }
    }
}

extension ChallengeViewModel: ChallengeViewModelType {
    func numberOfCells(section: Int) -> Int {
        return users.count
    }
    
    func idForUserAt(index: Int) -> Int {
        return users[index].id
    }
    
    func nameForUserAt(index: Int) -> String {
        return users[index].name
    }
    
    func usernameForUserAt(index: Int) -> String {
        return users[index].username
    }
    
    func emailForUserAt(index: Int) -> String {
        return users[index].email
    }
    
    func phoneForUserAt(index: Int) -> String {
        return users[index].phone
    }
    
    func initialForUserAt(index: Int) -> String {
        let inital = users[index].name.prefix(2)
        return String(inital)
    }
    
}
