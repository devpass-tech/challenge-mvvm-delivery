//
//  NetworkManager.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 25/01/23.
//

import Foundation

protocol NetworkManagerProtocol {
    func get<T: Decodable>(_ request: RequestProtocol, completion: @escaping (Result<T, NetworkError>) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get<T: Decodable>(_ request: RequestProtocol, completion: @escaping (Result<T, NetworkError>) -> ()) {
    
        session.dataTask(with: request.urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailure(error)))
                return
            }
            
            if response == nil {
                completion(.failure(.emptyResponse))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.emptyData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedData = try decoder.decode(T.self, from: safeData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodeFailure))
            }
            
        }.resume()
    }
}
