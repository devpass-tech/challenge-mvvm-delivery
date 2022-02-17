//
//  RestaurantModel.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 14/02/22.
//

import Foundation

struct RestaurantModel: Codable  {
    let name: String?
    let category: String?
    let delivery_time: DeliveryTime?
}

//enum CodingKeys: String, CodingKey {
//    case name, category
//    case deliveryTime = "delivery_time"
//}

