//
//  User.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 25/01/22.
//

import Foundation

struct User: Decodable, Encodable {
    let userName: String
    let userEmail: String
    
    init(userName: String, userEmail: String) {
        self.userName = userName
        self.userEmail = userEmail
    }
}
