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

    func fetchRestaurants(completion: @escaping (Result<[Restaurant],ServiceError>) -> Void) {
        networkManager.get(DeliveryApiRequest.fetchRestaurants.urlRequest) { (result: Result<[Restaurant], ServiceError>) in
            switch result {
            case .success(let restaurants):
                completion(.success(restaurants))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchSearchAddresses(_ completion: ([String]) -> Void) {

        completion(["Address 1", "Address 2", "Address 3"])
    }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
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
