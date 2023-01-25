//
//  Address.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 21/09/22.
//

import Foundation

struct Address: Decodable {
    let street: String
    let number: String
    let neighborhood: String
}
