//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 20/01/23.
//

import Foundation

protocol RestaurantDetailsViewModelProtocol {
    var restaurant: RestaurantDetails { get }
    
    func fetch(completion: @escaping () -> ())
}

final class RestaurantDetailsViewModel: RestaurantDetailsViewModelProtocol {
    
    private let service: DeliveryApiProtocol
    var restaurant: RestaurantDetails = .makeEmpty()
    
    init(service: DeliveryApiProtocol, restaurant: RestaurantDetails = .makeEmpty()) {
        self.service = service
        self.restaurant = restaurant
    }
    
    func fetch(completion: @escaping () -> ()) {
        service.fetchRestaurantDetails { restaurant in
            self.restaurant = restaurant
            completion()
        }
    }
    
}
