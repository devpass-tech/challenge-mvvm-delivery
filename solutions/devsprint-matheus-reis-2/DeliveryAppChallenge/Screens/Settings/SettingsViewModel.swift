//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Anderson Oliveira on 18/05/22.
//

import Foundation

//protocol SettingsViewModelProtocol {
//    func getUserName() -> String
//    func getUserEmail() -> String
//    func getUserAddress() -> String
//    func getUserPaymentMethod() -> String
//}

//final class SettingsViewModel: SettingsViewModelProtocol {
//
//    func getUserName() -> String {
//        return String(UserInfoData.userName.data)
//    }
//
//    func getUserEmail() -> String {
//        return String(UserInfoData.userEmail.data)
//    }
//
//    func getUserAddress() -> String {
//        return String(UserInfoData.userAddress.data)
//    }
//
//    func getUserPaymentMethod() -> String {
//        return String(UserInfoData.paymentMethod.data)
//    }
//}

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
