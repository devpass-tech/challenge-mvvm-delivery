//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi: DeliveryApiProtocol {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManagerService()) {
        self.networkManager = networkManager
    }

    func fetchRestaurants(completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        networkManager.get(DeliveryApiRequest.fetchRestaurants.urlRequest) { (result: Result<[Restaurant], ServiceError>) in
            switch result {
            case .success(let restaurants):
                completion(.success(restaurants))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchSearchAddresses(completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        networkManager.get(DeliveryApiRequest.fetchSearchAdresses.urlRequest) { (result: Result<[Address], ServiceError>) in
            switch result {
            case .success(let restaurants):
                completion(.success(restaurants))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchRestaurantDetails(completion: @escaping ((Result<RestaurantDetails, ServiceError>) -> Void)) {
        networkManager.get(DeliveryApiRequest.fetchRestaurantDetails.urlRequest) {(result:  Result<RestaurantDetails, ServiceError>) in
            switch result {
            case .success(let restauranteDetails):
                completion(.success(restauranteDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchMenuItem(completion: @escaping (Result<MenuItem,ServiceError>) -> Void) {
        networkManager.get(DeliveryApiRequest.fetchMenuItem.urlRequest) { (result: Result<MenuItem, ServiceError>) in
            switch result {
            case .success(let menu):
                completion(.success(menu))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
