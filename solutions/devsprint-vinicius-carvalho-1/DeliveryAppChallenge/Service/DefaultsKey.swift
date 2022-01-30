//
//  DefaultsUser.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 25/01/22.
//

import Foundation

public class DefaultsKey {
    static let user = DefaultsManager<User>(key: "user")
    static let adress = DefaultsManager<String>(key: "adress")
    static let paymentMethod = DefaultsManager<String>(key: "payment-method")
}
