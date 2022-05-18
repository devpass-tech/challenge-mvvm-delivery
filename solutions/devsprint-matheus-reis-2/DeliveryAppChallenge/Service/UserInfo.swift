//
//  UserInfo.swift
//  DeliveryAppChallenge
//
//  Created by Anderson Oliveira on 18/05/22.
//

import Foundation


struct UserInfo {
    private let defaults = UserDefaults.standard
    
    func getData(key: String) -> String {
        return defaults.string(forKey: key) ?? ""
    }
}
