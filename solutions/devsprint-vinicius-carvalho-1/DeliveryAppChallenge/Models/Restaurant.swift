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
    let reviews: Review
    let menu: [RestaurantItem]

    enum CodingKeys: String, CodingKey {
        case name, category, reviews, menu
        case deliveryTime = "delivery_time"
    }
}
