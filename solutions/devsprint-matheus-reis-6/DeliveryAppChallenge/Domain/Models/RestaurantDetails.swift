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
    let reviews: Review
    let menu: [MenuItem]
    
    static func makeEmpty() -> RestaurantDetails {
        return .init(name: "", category: "", deliveryTime: .init(min: 0, max: 0), reviews: .init(score: 0, count: 0), menu: [])
    }
}

struct Review: Decodable {
    let score: Double
    let count: Int
}
