//
//  MockRestaurantDetailsPresentable.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 13/11/21.
//

import Foundation
@testable import DeliveryAppChallenge

class MockRestaurantDetailsPresentable: RestaurantDetailsPresentable {
    
    var displayedDetails = false
    var displayedErros = false
    
    func displayRestaurantDetails(with restaurantDetails: Restaurant) {
        displayedDetails = true
    }
    
    func displayErros(error: Error) {
        displayedErros = true
    }
}
