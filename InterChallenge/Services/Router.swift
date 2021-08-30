//
//  Router.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import Alamofire
enum Router {
    
    case getUsers
    case getAlbunsByUser(userId: Int)
    case getPhotosByAlbum(albumId: Int)
    case getPostsByUser(userId: Int)
    case getCommentsByPosts(postId: Int)
    
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
            
        case .getAlbunsByUser(_):
            return "/albums"
            
        case .getPhotosByAlbum(_):
            return "/photos"
            
        case .getPostsByUser(_):
            return "/posts"
            
        case .getCommentsByPosts(_):
            return "/comments"
            
        }
    }
    
    var params: [URLQueryItem] {
        
        var queryItems:[URLQueryItem] = []
        
        switch self {
        case .getPostsByUser(let userId):
            queryItems.append(contentsOf: [
                URLQueryItem(name: "userId", value: userId.description),
            ])
            break
        case .getAlbunsByUser(let userId):
            queryItems.append(contentsOf: [
                URLQueryItem(name: "userId", value: userId.description),
            ])
            break
        case .getPhotosByAlbum(let albumId):
            queryItems.append(contentsOf: [
                URLQueryItem(name: "albumId", value: albumId.description),
            ])
            break
        case .getCommentsByPosts(let postId):
            queryItems.append(contentsOf: [
                URLQueryItem(name: "postId", value: postId.description),
            ])
            break
        default:
            break
        }
        
        return queryItems
    }
    
    var header: [String: String] {
        switch self {
        default:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        components.queryItems = self.params
        return components.url
    }
    
    var urlRequest: DataRequest? {
        guard let url = self.url else { return nil }
        
        let request = AF.request(url)
        
        return request
    }
}
