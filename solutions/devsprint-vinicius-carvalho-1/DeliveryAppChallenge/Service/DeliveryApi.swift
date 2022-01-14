//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi {

    func fetchRestaurants(_ completion: ([String]) -> Void) {

        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }

    func searchAddresses(_ completion: ([String]) -> Void) {

        completion(["Address 1", "Address 2", "Address 3"])
    }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: (String) -> Void) {

        completion("Menu Item")
    }
}
