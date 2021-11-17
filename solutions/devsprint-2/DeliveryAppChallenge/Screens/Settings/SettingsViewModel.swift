//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Pedro Boga on 17/11/21.
//

import Foundation
import UIKit

class SettingsViewModel {
    
    func getSavedName() -> String {
        guard let key = Keys(rawValue: Keys.name.rawValue) else { return "" }
        let name = DataSourceUserDefaults.getValue(with: key) as! String
        return name
    }
    
    func getSavedAddress() -> String {
        guard let key = Keys(rawValue: Keys.address.rawValue) else { return "" }
        let address = DataSourceUserDefaults.getValue(with: key) as! String
        return address
    }
    
    func getSavedEmail() -> String {
        guard let key = Keys(rawValue: Keys.email.rawValue) else { return "" }
        let email = DataSourceUserDefaults.getValue(with: key) as! String
        return email
    }
    
    func getSavedPayment() -> String {
        guard let key = Keys(rawValue: Keys.payment.rawValue) else { return "" }
        let payment = DataSourceUserDefaults.getValue(with: key) as! String
        return payment
    }
}

