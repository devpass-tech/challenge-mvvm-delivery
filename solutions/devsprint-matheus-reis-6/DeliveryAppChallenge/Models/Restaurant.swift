//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 11/05/22.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
}

struct DeliveryTime: Decodable {
    let min: Int
    let max: Int
}
