//
//  RestaurantsDetails.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 14/11/21.
//

import Foundation

struct RestaurantDetail: Codable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    let reviews: Reviews
    let menu: [Menu]
}

// MARK: - DeliveryTime
struct DeliveryTime: Codable {
    let min: Int
    let max: Int
}

// MARK: - Menu
struct Menu: Codable {
    let category: Category
    let name: String
    let price: Int
}

enum Category: String, Codable {
    case almoço = "Almoço"
    case caféDaManhã = "Café da manhã"
    case jantar = "Jantar"
}

// MARK: - Reviews
struct Reviews: Codable {
    let score: Double
    let count: Int
}
