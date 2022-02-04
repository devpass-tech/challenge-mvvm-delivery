//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiService {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], ServiceError>) -> Void)
    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void)
    func fetchRestaurantDetails(_ completion: @escaping (Result<Restaurant, ServiceError>) -> Void)
    func fetchMenuItem(_ completion: @escaping(Result<[RestaurantItem], ServiceError>) -> Void)
}

struct DeliveryApi {

    private let serviceManager: DeliveryApiService

    init(serviceManager: DeliveryApiService = DeliveryServiceImplementation()) {
        self.serviceManager = serviceManager
    }

    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void) {
        serviceManager.fetchRestaurants { result in
            switch result {
            case .success(let restaurantList):
                completion(restaurantList)
            case .failure:
                completion([])
            }
        }
    }

    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        serviceManager.searchAddresses { result in
            switch result {
            case .success(let addressList):
                completion(.success(addressList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchRestaurantDetails(_ completion: @escaping (Result<Restaurant, ServiceError>) -> Void) {
        serviceManager.fetchRestaurantDetails { result in
            switch result {
            case .success(let restaurant):
                completion(.success(restaurant))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchMenuItem(_ completion: @escaping(Result<[RestaurantItem], ServiceError>) -> Void) {
        serviceManager.fetchMenuItem { result in
            switch result {
            case .success(let items):
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
