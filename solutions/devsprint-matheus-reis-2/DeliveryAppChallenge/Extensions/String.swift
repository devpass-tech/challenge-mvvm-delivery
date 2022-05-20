//
//  String.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 19/05/22.
//

import Foundation

extension String {

    static func formattedRestaurantInfo(category: String, minDeliveryTime: Int, maxDeliveryTime: Int) -> String {

        return "\(category) • \(minDeliveryTime)-\(minDeliveryTime) min"
    }
}
