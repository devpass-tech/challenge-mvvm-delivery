//
//  MenuModel.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Francischett Occhiuto on 21/02/22.
//

import Foundation

struct RestaurantDetailsModel: Codable {
    let menu: [Menu]?
    let name: String?
    let category: String?
    let deliveryTime: DeliveryTime?
    let reviews: Reviews?
    
    enum CodingKeys: String, CodingKey {
        case name, category, menu, reviews
        case deliveryTime = "delivery_time"
    }
}
