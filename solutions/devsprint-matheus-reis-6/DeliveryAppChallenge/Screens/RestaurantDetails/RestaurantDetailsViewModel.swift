//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 20/01/23.
//

import Foundation

protocol RestaurantDetailsViewModelProtocol {
    var restaurant: RestaurantDetails { get }
    
    func fetch(completion: @escaping (NetworkError?) -> ())
}

final class RestaurantDetailsViewModel: RestaurantDetailsViewModelProtocol {
    
    private let service: DeliveryApiProtocol
    var restaurant: RestaurantDetails = .makeEmpty()
    weak var coordinator: RestaurantDetailsCoordinator?
    
    init(service: DeliveryApiProtocol, restaurant: RestaurantDetails = .makeEmpty()) {
        self.service = service
        self.restaurant = restaurant
    }
    
    deinit {
        coordinator?.finish()
    }
    
    func fetch(completion: @escaping (NetworkError?) -> ()) {
        service.fetchRestaurantDetails { result in
            switch result {
            case .success(let restaurant):
                self.restaurant = restaurant
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
