//
//  RestaurantDetailsPresentableMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 29/01/22.
//

import Foundation

@testable import DeliveryAppChallenge

class RestaurantDetailsPresentableMock: RestaurantDetailsPresentable {

    var displayedDetails = false
    var displayedErrors = false

    func displayRestaurantDetails(with restaurant: Restaurant) {
        displayedDetails = true
    }

    func displayError(error: Error) {
        displayedErrors = true
    }
}
