//
//  SettingsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Strutzki on 25/01/22.
//

import Foundation

class SettingsViewModel: SettigsViewModelType {
    
    var coordinator: SettingsCoordinator?
    
    func onFinish() {
        coordinator?.onFinish()
    }
    
    func getName() -> String {
        DefaultsKey.user.value?.userName ?? ""
    }
    
    func getEmail() -> String {
        DefaultsKey.user.value?.userEmail ?? ""
    }
    
    func getAddress() -> String {
        DefaultsKey.adress.value ?? ""
    }
    
    func getPaymentMethod() -> String {
        DefaultsKey.paymentMethod.value ?? ""
    }
}
