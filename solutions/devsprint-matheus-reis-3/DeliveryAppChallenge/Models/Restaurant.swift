//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 11/05/22.
//

import Foundation

struct DeliveryTime: Decodable {
    var min: Int
    var max: Int
}

struct Restaurant: Decodable {
    var name: String
    var category: String
    var deliveryTime: DeliveryTime
    
    enum CodingKeys: String, CodingKey {
        case name,category
        case deliveryTime = "delivery_time"
    }
}
