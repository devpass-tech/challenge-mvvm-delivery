//
//  RestaurantItem.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation

struct RestaurantItem: Decodable {
    let category: String
    let name: String
    let price: Double
}
