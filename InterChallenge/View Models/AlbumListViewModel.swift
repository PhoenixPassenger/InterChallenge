//
//  AlbumListViewModel.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
final class AlbumListViewModel {
    public weak var output: ListViewModelOutput?
    
    var albums = [Album]()
    func loadAlbumsBy(userId: Int){
        ServiceLayer.request(router: .getAlbunsByUser(userId: userId)) { [weak self] (result: Result<[Album], Error>) in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
                
            case .success(let albums):
                self.albums = albums
                DispatchQueue.main.async {
                    self.output?.needToReload()
                }
            }
        }
    }
}
extension AlbumListViewModel: AlbumListViewModelType {
    func numberOfCells(section: Int) -> Int {
        return albums.count
    }
    
    func titleForAlbumAt(index: Int) -> String {
        return albums[index].title
    }
    
    func idForAlbumAt(index: Int) -> Int {
        return albums[index].id
    }
}
