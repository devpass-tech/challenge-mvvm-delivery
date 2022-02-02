//
//  SettingsViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Guilherme Strutzki on 29/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

class SettingsViewModelTests: XCTestCase {
    
    func testSettingsViewModel() {
        let settingsViewModel = SettingsViewModel()
        let name = "John Appleseed"
        let address = "Rua Bela Cintra, 495 - Consolação"
        let email = "john@apple.com"
        let paymentMethod = "Cartão de Crédito"
        
        XCTAssertEqual(settingsViewModel.getName(), name)
        XCTAssertEqual(settingsViewModel.getEmail(), email)
        XCTAssertEqual(settingsViewModel.getAddress(), address)
        XCTAssertEqual(settingsViewModel.getPaymentMethod(), paymentMethod)
    }
}
