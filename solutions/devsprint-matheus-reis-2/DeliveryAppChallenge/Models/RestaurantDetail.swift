//
//  RestaurantDetail.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 25/05/22.
//

import Foundation

struct RestaurantDetail: Codable {
    let name, category: String
    let deliveryTime: DeliveryTime
    let reviews: Reviews
    let menu: [Menu]
}

struct Reviews: Codable {
    let score: Double
    let count: Int
}

struct Menu: Codable {
    let category: String
    let name: String
    let price: Int
}
