//
//  DeliveryTime.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation

struct DeliveryTime: Decodable {
    let minimum: Int
    let maximum: Int

    private enum CodingKeys: String, CodingKey {
        case minimum = "min"
        case maximum = "max"
    }
}
