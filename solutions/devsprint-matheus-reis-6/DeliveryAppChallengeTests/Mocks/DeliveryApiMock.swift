//
//  DeliveryApiMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Matheus dos Reis de Jesus on 24/01/23.
//

import Foundation
@testable import DeliveryAppChallenge

final class DeliveryApiMock: DeliveryApiProtocol {
    
    var networkError: NetworkError?
    
    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void) {
        let restaurant = Restaurant(name: "Benjamim A Padaria", category: "Padaria", deliveryTime: .init(min: 23, max: 33))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            completion([restaurant])
        }
    }
    
    func fetchRestaurantDetails(_ completion: @escaping (Result<RestaurantDetails, NetworkError>) -> Void) {
        let restaurant = RestaurantDetails(name: "Benjamim A Padaria", category: "Padaria", deliveryTime: .init(min: 23, max: 33), reviews: .init(score: 4.7, count: 351), menu: [])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            if let error = self.networkError {
                completion(.failure(error))
            } else {
                completion(.success(restaurant))
            }
        }
    }
    
    func fetchMenuItem(_ completion: @escaping (MenuItem) -> Void) {
        let menuItem = MenuItem(name: "Pão de queijo", price: 20, category: "Comida", description: "Melhor do mundo")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            completion(menuItem)
        }
    }
    
    func searchAddresses(_ completion: @escaping ([DeliveryAppChallenge.Address]) -> Void) {
        let address = Address()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            completion([address])
        }
    }
}
