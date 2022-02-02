//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiService {
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantsListModel], ServiceError>) -> Void)
    func searchAddresses(_ completion: ([String]) -> Void)
    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetailsModel?) -> Void)
    func fetchMenuItem(_ completion: (String) -> Void)
}

struct DeliveryApi {

    private let serviceManager: DeliveryApiService

    init(serviceManager: DeliveryApiService = DeliveryServiceImplementation()) {
        self.serviceManager = serviceManager
    }

    func fetchRestaurants(_ completion: @escaping ([RestaurantsListModel]) -> Void) {
        serviceManager.fetchRestaurants { result in
            switch result {
            case .success(let restaurantList):
                completion(restaurantList)
            case .failure:
                completion([])
            }
        }
    }

    func searchAddresses(_ completion: ([String]) -> Void) {
        serviceManager.searchAddresses { addresses in
            completion(addresses)
        }
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetailsModel?) -> Void) {
        serviceManager.fetchRestaurantDetails { details in
            guard let restaurantDetails = details else {
                completion(nil)
                return
            }
            return completion(restaurantDetails)
        }
    }

    func fetchMenuItem(_ completion: (String) -> Void) {
        serviceManager.fetchMenuItem { items in
            completion(items)
        }
    }
}
