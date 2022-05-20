//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Cora on 18/05/22.
//

import Foundation

protocol SettingsViewModelProtocol {
    func getUserName() -> String
    func getUserEmail() -> String
    func getUserAddress() -> String
    func getUserPaymentMethod() -> String
}

final class SettingsViewModel: SettingsViewModelProtocol {
    
    func getUserName() -> String {
        return String(UserInfoData.userName.data)
    }
    
    func getUserEmail() -> String {
        return String(UserInfoData.userEmail.data)
    }
    
    func getUserAddress() -> String {
        return String(UserInfoData.userAddress.data)
    }
    
    func getUserPaymentMethod() -> String {
        return String(UserInfoData.paymentMethod.data)
    }
}

extension SettingsViewModel {
    private enum UserInfoData {
        case userName
        case userEmail
        case userAddress
        case paymentMethod
        
        var data: String {
            switch self {
            case .userName:
                return UserInfo.getData(key: "user-name")
            case .userEmail:
                return UserInfo.getData(key: "user-email")
            case .userAddress:
                return UserInfo.getData(key: "address")
            case .paymentMethod:
                return UserInfo.getData(key: "payment-method")
            }
        }
    }
}



