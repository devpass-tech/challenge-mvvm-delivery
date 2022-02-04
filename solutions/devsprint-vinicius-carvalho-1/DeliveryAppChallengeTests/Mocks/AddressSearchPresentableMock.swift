//
//  AddressSearchPresentableMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Amaryllis Baldrez on 03/02/22.
//

import Foundation

@testable import DeliveryAppChallenge

class AddressSearchPresentableMock: AddressSearchPresentable {

    var displayedDetails = false
    var displayedErrors = false

    func displayAddressSearch(with address: Address) {
        displayedDetails = true
    }

    func displayError(error: Error) {
        displayedErrors = true
    }
}

