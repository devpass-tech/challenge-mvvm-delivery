//
//  HomeViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 19/01/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var restaurants: [Restaurant] { get }
    
    func fetch(completion: @escaping () -> ())
    func didTapRestaurant(restaurant: Restaurant)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let service: DeliveryApiProtocol
    var coordinator: HomeCoordinator?
        
    var restaurants: [Restaurant] = []
    
    init(service: DeliveryApiProtocol) {
        self.service =  service
    }
    
    func fetch(completion: @escaping () -> ()) {
        service.fetchRestaurants { restaurants in
            self.restaurants = restaurants
            
            completion()
        }
    }
    
    func didTapRestaurant(restaurant: Restaurant) {
        coordinator?.goToRestaurantDetails()
    }
}
