//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 24/01/22.
//

import Foundation

struct Restaurant: Codable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    let reviews: Reviews?
    let menu: [MenuItem]?

    enum CodingKeys: String, CodingKey {
        case name, category, reviews, menu
        case deliveryTime = "delivery_time"
    }
}

struct DeliveryTime: Codable {
    let min: Int
    let max: Int
}

struct Reviews: Codable {
    let score: Double
    let count: Int
}

struct MenuItem: Codable {
    let category: String
    let name: String
    let price: Double
}
