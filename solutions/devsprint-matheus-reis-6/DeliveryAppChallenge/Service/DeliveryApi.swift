//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

class DeliveryApi {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchRestaurants(_ completion: ([Restaurant]) -> Void) {
        self.networkManager.get(urlRequest: DeliveryRequest.restaurants) { (result: Result<[Restaurant], NetworkError>) in
            switch result {
            case .success(let restaurant):
                completion(restaurant)
            case .failure(let error):
                print(error)
            }
        }
    }

    func searchAddresses(_ completion: ([Address]) -> Void) {
        self.networkManager.get(urlRequest: DeliveryRequest.addresses) { (result: Result<[Address], NetworkError>) in
            switch result {
            case .success(let addresses):
                completion(addresses)
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchRestaurantDetails(_ completion: (RestaurantDetails) -> Void) {

        completion(RestaurantDetails())
    }

    func fetchMenuItem(_ completion: (MenuItemDetails) -> Void) {

        completion(MenuItemDetails())
    }
}
