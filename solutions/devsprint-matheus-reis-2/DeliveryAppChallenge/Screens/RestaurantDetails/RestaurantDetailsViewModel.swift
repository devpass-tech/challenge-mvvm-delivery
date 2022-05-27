//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 26/05/22.
//

import Foundation

final class RestaurantDetailsViewModel {
    
    private let service: DeliveryApiProtocol
    var coordinator: RestaurantDetailsCoordinator?
    
    public var restaurantsDetailMenu: [Menu] = []
    
    init(service: DeliveryApiProtocol) {
        self.service = service
    }
    
    func getRestaurantDetails (completion: @escaping () -> Void) {
        service.fetchRestaurantDetails { (resut: Result<RestaurantDetail, DeliveryApiError>) in
            switch resut {
            case .success(let restaurants):
                self.restaurantsDetailMenu = restaurants.menu
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RestaurantDetailsViewModel: MenuListViewDataSource {
    func getData(at: Int) -> Menu {
        restaurantsDetailMenu[at]
    }
    
    func getItemCount() -> Int {
        restaurantsDetailMenu.count
    }
}
