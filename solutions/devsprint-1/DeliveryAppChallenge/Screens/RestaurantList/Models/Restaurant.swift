//
//  Restaurant.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 08/11/21.
//

import Foundation

// MARK: - Restaurant

struct Restaurant: Codable {
    let name: String
    let category: String
    let deliveryTime: DeliveryTime
}

// MARK: - Restaurant + CustomStringConvertible

extension Restaurant: CustomStringConvertible {
    var description: String {
        return "\nName: \(name), category: \(category), deliveryTime (min/max): \(deliveryTime.min)/\(deliveryTime.max)"
    }
}
