//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 21/09/22.
//

import Foundation

struct RestaurantDetails: Decodable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
    let reviews: Reviews
    let menu: [MenuItem]
    
    static func makeEmpty() -> RestaurantDetails {
        .init(name: "", category: "", deliveryTime: .init(min: 0, max: 0), reviews: .init(score: 0, count: 0), menu: [])
    }
}

struct Reviews: Decodable {
    let score: Double
    let count: Int
}
