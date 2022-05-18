//
//  UserInfo.swift
//  DeliveryAppChallenge
//
//  Created by Anderson Oliveira on 18/05/22.
//

import Foundation


struct UserInfo {
    
    private init() {}
    
    static var shared = UserInfo()
    
     func getData(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
}
