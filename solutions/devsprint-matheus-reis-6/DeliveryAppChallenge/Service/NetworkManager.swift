//
//  NetworkManager.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 23/01/23.
//

import Foundation

protocol NetworkManagerProtocol {
    associatedtype R: Request
    func get<T: Decodable>(_ request: R, completion: @escaping (Result<T, NetworkError>) -> ())
}

final class NetworkManager<R: Request>: NetworkManagerProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(_ request: R, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        session.dataTask(with: request.urlRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.requestFailure(error)))
                return
            }
            
            if response == nil {
                completion(.failure(.emptyResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let result = try? decoder.decode(T.self, from: data) else {
                completion(.failure(.decodeFailure))
                return
            }
            
            completion(.success(result))
        }.resume()
    }
}
