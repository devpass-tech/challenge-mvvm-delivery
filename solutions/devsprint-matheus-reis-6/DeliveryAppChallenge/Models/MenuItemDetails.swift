//
//  MenuItemDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 21/09/22.
//

import Foundation

struct MenuItem: Decodable {
    let name: String
    let price: Int
    let category: String?
    let description: String?
}
