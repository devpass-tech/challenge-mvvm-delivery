//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantModel]?, APIError>) -> Void)
    func fetchMenuItem(_ completion: @escaping (Result<[RestaurantMenuModel]?, APIError>) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    let delegate: APIManagerProtocol = ApiManager()

    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantModel]?, APIError>) -> Void) {
        let pathUrl = "/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json"
        delegate.performRequest(pathURL: pathUrl, method: .get, completion: completion)
    }

    func searchAddresses(_ completion: ([String]) -> Void) {

        completion(["Address 1", "Address 2", "Address 3"])
    }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: @escaping (Result<[RestaurantMenuModel]?, APIError>) -> Void) {
        let pathUrl = "/devpass-tech/challenge-delivery-app/main/api/restaurant_details.json"
        delegate.performRequest(pathURL: pathUrl, method: .get, completion: completion)
    }
    
///devpass-tech/challenge-delivery-app/main/api/restaurant_details.json
}
