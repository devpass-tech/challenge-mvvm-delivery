//
//  DeliveryServiceStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Gustavo Soares on 31/01/22.
//

import Foundation
@testable import DeliveryAppChallenge

final class DeliveryApiServiceStub: DeliveryApiService {
    var expectedRestaurants: Result<[Restaurant], ServiceError> = .success([])
    var expectedItems = ""
    var expectedDetails: Result<Restaurant, ServiceError> = .success(Restaurant(name: "", category: "", deliveryTime: DeliveryTime(min: 0, max: 0), reviews: nil, menu: nil))
    var expectedAddresses: Result<[Address], ServiceError> = .success([])

    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        completion(expectedRestaurants)
    }

    func fetchMenuItem(_ completion: (String) -> Void) {
        completion(expectedItems)
    }

    func fetchRestaurantDetails(_ completion: @escaping (Result<Restaurant, ServiceError>) -> Void) {
        completion(expectedDetails)
    }

    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        completion(expectedAddresses)
    }
}
