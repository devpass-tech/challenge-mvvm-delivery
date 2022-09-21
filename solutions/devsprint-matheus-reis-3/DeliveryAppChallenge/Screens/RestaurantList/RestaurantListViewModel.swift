//
//  RestaurantListViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 04/08/22.
//

import Foundation

protocol RestaurantListViewPresentable: AnyObject {
    func reloadList()
}

final class RestaurantListViewModel {
    
    private let service: DeliveryApiProtocol
    weak var presenter: RestaurantListViewPresentable?
    
    public var restaurants: [Restaurant] = []
    
    init(service: DeliveryApiProtocol) {
        self.service = service
    }
    
    public func fetchRestaurants() {
        service.fetchRestaurants { result in
            switch result {
            case .success(let restaurants):
                self.restaurants = restaurants
                self.presenter?.reloadList()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RestaurantListViewModel: RestaurantListViewDataSource {
    func getItem(at index: Int) -> Restaurant {
        return restaurants[index]
    }
    
    func getItemCount() -> Int {
        return restaurants.count
    }
}
