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
        completion([])
    }

    func searchAddresses(_ completion: @escaping ([Address]) -> Void) {
        self.networkManager.get(urlRequest: DeliveryRequest.addresses) { (result: Result<[Address], NetworkError>) in
            switch result {
            case .success(let address):
                completion(address)
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
