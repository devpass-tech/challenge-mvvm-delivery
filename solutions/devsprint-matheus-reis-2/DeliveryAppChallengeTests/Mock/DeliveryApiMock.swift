//
//  DeliveryApiMock.swift
//  DeliveryAppChallengeTests
//
//  Created by pedro tres on 23/05/22.
//

import Foundation
@testable import DeliveryAppChallenge

class DeliveryApiMock: DeliveryApiProtocol {
    var error: DeliveryApiError?
    
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void) {
        switch error {
        case .invalidURL:
            completion(.failure(.invalidURL))
        case .requestError:
            completion(.failure(.requestError(description: "request error")))
        case .invalidResponse:
            completion(.failure(.invalidResponse))
        case .invalidData:
            completion(.failure(.invalidData))
        case .decodingError:
            completion(.failure(.decodingError(description: "deconding error")))
        default:
            completion(.success([Restaurant(name: "Giraffas", category: "fast-food", deliveryTime: DeliveryTime(min: 10, max: 25))]))
        }
    }
    
    func searchAddresses(_ completion: @escaping (Result<[Address], DeliveryApiError>) -> Void) {
        
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        
    }
    
    func fetchMenuItem(_ completion: (String) -> Void) {
        
    }
    
    
}


