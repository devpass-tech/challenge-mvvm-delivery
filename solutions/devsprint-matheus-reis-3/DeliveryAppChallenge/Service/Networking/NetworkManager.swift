//
//  NetworkManager.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 01/08/22.
//

import Foundation

protocol NetworkManager {
    var session: URLSession { get }
    
    func get(_ request: URLRequest, completion: @escaping ((Result<Data,ServiceError>) -> Void))
}

final class NetworkManagerService: NetworkManager {
    
    let session: URLSession
    
    private var dataTask: URLSessionDataTask?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    func get(_ request: URLRequest, completion: @escaping ((Result<Data, ServiceError>) -> Void)) {
        
        dataTask = session.dataTask(with: request) { (data,response,error) in
            
            if let error = error {
                completion(.failure(.requestFailure(error.localizedDescription)))
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(.failure(.emptyData))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask?.resume()
    }
}
