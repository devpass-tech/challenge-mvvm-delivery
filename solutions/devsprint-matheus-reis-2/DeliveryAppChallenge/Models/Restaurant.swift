//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 11/05/22.
//

import Foundation

struct Restaurant: Codable {
    let name, category: String
    let deliveryTime: DeliveryTime
}

struct DeliveryTime: Codable {
    let min, max: Int
}
