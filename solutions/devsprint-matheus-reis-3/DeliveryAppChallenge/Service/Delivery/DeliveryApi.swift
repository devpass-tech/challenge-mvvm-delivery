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
        networkManager.get(DeliveryApiRequest.fetchRestaurants.urlRequest) { result in
            switch result {
            case .success(let data):
                guard let restaurants = try? JSONDecoder().decode([Restaurant].self, from: data) else {
                    completion(.failure(.decodingError))
                    return
                }
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

    func fetchMenuItem(_ completion: (String) -> Void) {

        completion("Menu Item")
    }
}
