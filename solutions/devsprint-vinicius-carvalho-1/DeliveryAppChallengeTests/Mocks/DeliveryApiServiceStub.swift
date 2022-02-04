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
    var expectedItems: Result<[RestaurantItem], ServiceError> = .success([])
    var expectedDetails: Result<Restaurant, ServiceError> = .success(Restaurant(name: "", category: "", deliveryTime: DeliveryTime(minimum: 0, maximum: 0), reviews: Review(score: 10, count: 10), menu: []))
    var expectedAddresses: Result<[Address], ServiceError> = .success([])

    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        completion(expectedRestaurants)
    }

    func fetchMenuItem(_ completion: @escaping (Result<[RestaurantItem], ServiceError>) -> Void) {
        completion(expectedItems)
    }

    func fetchRestaurantDetails(_ completion: @escaping (Result<Restaurant, ServiceError>) -> Void) {
        completion(expectedDetails)
    }

    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        completion(expectedAddresses)
    }
}
