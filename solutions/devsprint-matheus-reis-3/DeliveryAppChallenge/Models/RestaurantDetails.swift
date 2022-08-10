//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Eduardo Matheus Oliveira de Córdova on 05/08/22.
//

import Foundation

struct RestaurantDetails: Decodable {
    var name: String;
    var category: String;
    var deliveryTime: DeliveryTime
    var reviews: Reviews
    var menuItens: [MenuItem]
    
    enum CodingKeys: String, CodingKey{
        case name, category
        case deliveryTime = "delivery_time"
        case reviews = "reviews"
        case menuItens = "menu"
    }
}

struct DeliveryTime: Decodable{
    var min: Int
    var max: Int
}

struct Reviews: Decodable{
    var score: Double
    var count: Int
}

struct MenuItem: Decodable{
    var category: String
    var name: String
    var price: Int
}
