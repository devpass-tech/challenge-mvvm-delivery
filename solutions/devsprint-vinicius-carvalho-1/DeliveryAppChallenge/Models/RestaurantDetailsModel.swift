//
//  RestaurantDetailsModel.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 27/01/22.
//

import Foundation

struct RestaurantDetailsModel: Codable {

	let name: String
	let category: String
	let deliveryTime: DeliveryTime
	let reviews: Reviews
	let menu: Menu

	struct DeliveryTime: Codable {
		let min: Int
		let max: Int
	}

	struct Reviews: Codable {
		let score: Double
		let count: Int
	}

	struct Menu: Codable {
		let name: String
		let category: String
		let price: Double
	}

	private enum CodingKeys: String, CodingKey {
		case name, category, reviews, menu
		case deliveryTime = "delivery_time"
	}
}
