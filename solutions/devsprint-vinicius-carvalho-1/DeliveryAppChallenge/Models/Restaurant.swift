//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation

struct DeliveryTime: Decodable {
    let minimum: Int
    let maximum: Int

    private enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
    }
}

struct Review: Decodable {
    let score: Double
    let count: Int
}


struct Restaurant: Decodable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    let reviews: Review
    let menu: [RestaurantItem]

    private enum CodingKeys: String, CodingKey {
        case name, category, reviews, menu
        case deliveryTime = "delivery_time"
    }
}

struct RestaurantItem: Decodable {
    let category: String
    let name: String
    let price: Double
}
