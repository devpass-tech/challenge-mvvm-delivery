//
//  RestaurantModel.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 14/02/22.
//

import Foundation

struct RestaurantModel: Codable  {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime?
}

struct DeliveryTime: Codable {
    let max: Int
    let min: Int
}

enum CodingKeys: String, CodingKey {
    case name, category
    case time = "delivery_time"
}
