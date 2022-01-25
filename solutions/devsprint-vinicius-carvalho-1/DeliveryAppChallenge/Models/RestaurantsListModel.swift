//
//  RestaurantsListModel.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 24/01/22.
//

import Foundation

struct RestaurantsListModel: Codable {
	let name: String
	let category: String
	let deliveryTime: DeliveryTime

	struct DeliveryTime: Codable {
		let min: Int
		let max: Int
	}

	private enum CodingKeys: String, CodingKey {
		case name, category
		case deliveryTime = "delivery_time"
	}
}
