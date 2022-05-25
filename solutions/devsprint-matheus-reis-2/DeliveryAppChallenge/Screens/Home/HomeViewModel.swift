//
//  HomeViewModel.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 18/05/22.
//

import Foundation

final class HomeViewModel {
    
    private let service: DeliveryApiProtocol
    
    public var restaurants: [Restaurant] = []
    
    init(service: DeliveryApiProtocol){
        self.service = service
    }
    
    func getRestaurantList(completion: @escaping () -> Void) {
        service.fetchRestaurants { (resut: Result<[Restaurant], DeliveryApiError>) in
            switch resut {
            case .success(let restaurants):
                self.restaurants = restaurants
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension HomeViewModel: RestaurantListViewDataSource {
    func getData(at: Int) -> Restaurant {
        return restaurants[at]
    }
    
    func getItemCount() -> Int {
        return restaurants.count
    }
}

