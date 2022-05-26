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
    let menu: [MenuItem]
}

struct Reviews: Codable {
    let score: Double
    let count: Int
}
