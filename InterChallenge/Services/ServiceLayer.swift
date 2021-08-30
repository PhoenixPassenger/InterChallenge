//
//  ServiceLayer.swift
//  InterChallenge
//
//  Created by Rodrigo Silva Ribeiro on 28/08/21.
//

import Foundation
import Alamofire
struct ServiceLayer {
    
    static func request<T:Decodable>(router: Router, completion: @escaping (Result<T, Error>) -> Void ) {
        self.request(router: router) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(DecodeError.noDataProvided))
                    return
                }
                let jsonDecoder = JSONDecoder.init()
                do {
                   let result = try jsonDecoder.decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(DecodeError.decodeFailure(description: error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func request(router: Router, completion: @escaping (Result<Data?, ServiceError>) -> Void) {
        
        guard let request = router.urlRequest else {
            completion(.failure(ServiceError.malformedURLRequest(url: router.url?.absoluteString ?? "nil")))
            return
        }
        request.responseJSON { response in
            guard response.error == nil else {
                switch response.error!.responseCode {
                case 400:
                    completion(.failure(.badRequest))
                case 404:
                    completion(.failure(.notFound))
                default:
                    completion(.failure(.unknownError(statusCode: response.error!.responseCode!)))
                }
                return
            }
            completion(.success(response.data))
        }
    }
    
    static func download(url: String, completion: @escaping (Result<Data?, ServiceError>) -> Void) {
        AF.download(url).responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                guard let code = error.responseCode else { return }
                completion(.failure(.unknownError(statusCode: code)))
            }
        }
    }
}
