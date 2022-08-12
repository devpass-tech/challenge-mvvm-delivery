//
//  DeliveryApiProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 01/08/22.
//

import Foundation

protocol DeliveryApiProtocol {
    var networkManager: NetworkManager { get }
    
    func fetchRestaurants(completion: @escaping ((Result<[Restaurant],ServiceError>) -> Void))
    
    func fetchRestaurantDetails(completion: @escaping ((Result<RestaurantDetails, ServiceError>) -> Void))

    func fetchSearchAddresses(completion: @escaping (Result<[Address], ServiceError>) -> Void)
}
