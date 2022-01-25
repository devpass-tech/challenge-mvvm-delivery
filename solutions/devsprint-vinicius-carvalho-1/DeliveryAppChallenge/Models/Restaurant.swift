//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation

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
