//
//  PhotoListViewModel.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import UIKit
final class PhotoListViewModel {
    public weak var output: PhotoListViewModelOutput?
    var images: [UIImage?] = []
    var thumbnailImages: [UIImage?] = []
    var photos = [Photo]()
    func loadPhotosBy(albumId: Int){
        ServiceLayer.request(router: .getPhotosByAlbum(albumId: albumId)) { [weak self] (result: Result<[Photo], Error>) in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
                
            case .success(let photos):
                self.photos = photos
                self.images = [UIImage?](repeating: nil, count: photos.count)
                self.thumbnailImages = [UIImage?](repeating: nil, count: photos.count)
                DispatchQueue.main.async {
                    self.output?.needToReload()
                }
            }
        }
    }
}
extension PhotoListViewModel: PhotoListViewModelType {
    func imageForPhotoCellAt(index: Int) -> UIImage? {
        if self.images[index] == nil {
            self.imageForPhotoAt(index: index)
        }
        return self.images[index]
    }
    
    func thumbnailImageForPhotoCellAt(index: Int) -> UIImage? {
        if self.thumbnailImages[index] == nil {
            self.thumbnailImageForPhotoAt(index: index)
        }
        return self.thumbnailImages[index]
    }
    
    func imageForPhotoAt(index: Int) {
        let url = photos[index].url
        ServiceLayer.download(url: url){ result in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
            case .success(let data):
                guard let data = data else { return }
                let image = UIImage(data: data)
                if let image = image {
                    self.thumbnailImages[index] = image
                    DispatchQueue.main.async {
                        self.output?.performSegue(index: index, image: image)
                    }
                }
            }
        }
    }
    
    func thumbnailImageForPhotoAt(index: Int){
        let url = photos[index].thumbnailUrl
        ServiceLayer.download(url: url){ result in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self.output?.needToShowFailureAlert()
                }
            case .success(let data):
                guard let data = data else { return }
                let image = UIImage(data: data)
                if let image = image {
                    self.thumbnailImages[index] = image
                    DispatchQueue.main.async {
                        self.output?.reloadCell(index: index)
                    }
                }
            }
        }
    }
    
    func titleForPhotoAt(index: Int) -> String {
        return photos[index].title
    }
    
    func numberOfCells(section: Int) -> Int {
        return photos.count
    }
}
