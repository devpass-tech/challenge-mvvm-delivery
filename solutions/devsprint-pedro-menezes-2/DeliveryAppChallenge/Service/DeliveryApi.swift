//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi {

    func fetchRestaurants(_ completion: ([Restaurant]) -> Void) {

        completion([])
    }

    func searchAddresses(_ completion: ([Address]) -> Void) {

        completion([])
    }

    func fetchRestaurantDetails(_ completion: (RestaurantDetails) -> Void) {

        completion(RestaurantDetails())
    }

    func fetchMenuItem(_ completion: (MenuItemDetails) -> Void) {

        completion(MenuItemDetails())
    }
}
