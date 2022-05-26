//
//  MenuItemDetails.swift
//  DeliveryAppChallenge
//
//  Created by Luiza Moruz on 18/05/22.
//

import Foundation

struct MenuItem: Codable {
    let name: String
    let description: String
    let price: Float
    
    func formattedPrice() -> String {
        return "R$ \(price)"
    }
}
