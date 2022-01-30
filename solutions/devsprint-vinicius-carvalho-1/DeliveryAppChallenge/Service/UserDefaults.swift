//
//  UserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 25/01/22.
//

import Foundation

extension UserDefaults {
    func removeAll() {
        for (key, _) in dictionaryRepresentation() {
            removeObject(forKey: key)
        }
        synchronize()
    }
    
}
