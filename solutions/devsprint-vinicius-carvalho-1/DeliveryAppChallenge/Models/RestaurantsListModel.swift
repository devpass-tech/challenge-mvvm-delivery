//
//  RestaurantsListModel.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 24/01/22.
//

import Foundation

struct RestaurantsListModel: Decodable {
	let name: String
	let category: String
	let deliveryTime: DeliveryTime
    let reviews: Review
    let menu: [RestaurantItem]

	struct DeliveryTime: Codable {
		let min: Int
		let max: Int
	}

	private enum CodingKeys: String, CodingKey {
		case name, category, reviews, menu
		case deliveryTime = "delivery_time"
	}
}
