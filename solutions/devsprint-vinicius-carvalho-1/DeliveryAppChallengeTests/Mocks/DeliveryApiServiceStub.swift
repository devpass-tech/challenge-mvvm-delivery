//
//  DeliveryServiceStub.swift
//  DeliveryAppChallengeTests
//
//  Created by Gustavo Soares on 31/01/22.
//

import Foundation
@testable import DeliveryAppChallenge

final class DeliveryApiServiceStub: DeliveryApiService {
    var expectedRestaurants: Result<[RestaurantsListModel], ServiceError> = .success([])
    var expectedItems = ""
    var expectedDetails: RestaurantDetailsModel?
    var expectedAddresses: Result<[Address], ServiceError> = .success([])

    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantsListModel], ServiceError>) -> Void) {
        completion(expectedRestaurants)
    }

    func fetchMenuItem(_ completion: (String) -> Void) {
        completion(expectedItems)
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetailsModel?) -> Void) {
        completion(expectedDetails)
    }

    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        completion(expectedAddresses)
    }
}
