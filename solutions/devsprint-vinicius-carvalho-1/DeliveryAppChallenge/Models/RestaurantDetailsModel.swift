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
	let reviews: Review
	let menu: [RestaurantItem]

	private enum CodingKeys: String, CodingKey {
		case name, category, reviews, menu
		case deliveryTime = "delivery_time"
	}
}
