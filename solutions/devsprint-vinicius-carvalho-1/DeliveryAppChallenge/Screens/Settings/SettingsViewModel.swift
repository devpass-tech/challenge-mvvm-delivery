//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Strutzki on 25/01/22.
//

import Foundation

struct SettingsViewModel {
    func getName() -> String {
        //TODO: retrieve data from UserDefaults
        "John Appleseed"
        
    }
    
    func getEmail() -> String {
        //TODO: retrieve data from UserDefaults
        "john@apple.com"
    }
    
    func getAddress() -> String {
        //TODO: retrieve data from UserDefaults
        "Rua Bela Cintra, 495 - Consolação"
    }
    
    func getPaymentMethod() -> String {
        //TODO: retrieve data from UserDefaults
        "Cartão de Crédito"
    }
}
