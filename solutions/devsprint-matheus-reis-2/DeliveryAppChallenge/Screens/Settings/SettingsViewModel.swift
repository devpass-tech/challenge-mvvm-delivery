//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Anderson Oliveira on 18/05/22.
//

import Foundation

final class SettingsViewModel {
    
     enum UserInfoData: String {
        case userName = "user-name"
        case userEmail = "user-email"
        case userAddress = "address"
        case paymentMethod = "payment-method"
    }
    
    func getInfo(for key: UserInfoData) -> String {
        return UserInfo.getData(key: key.rawValue)
    }

}
