//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 09/11/21.
//

import Foundation

import Foundation

struct RestaurantDetails: Decodable {
	let name: String
	let category: String
	let deliveryTime: DeliveryTime
	let reviews: Reviews
	let menu: [MenuItem]
}

struct DeliveryTime: Decodable {
	let min: Int
	let max: Int
}

struct Reviews: Decodable {
	let score: Double
	let count: Int
}

struct MenuItem: Decodable {
	let category: String
	let name: String
	let price: Double
}
