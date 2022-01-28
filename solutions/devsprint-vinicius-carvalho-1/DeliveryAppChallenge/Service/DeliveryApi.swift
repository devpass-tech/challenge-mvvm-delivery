//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

// TODO: Use service abstraction
struct DeliveryApi {

    private let serviceManager: APIServiceProtocol

    init(serviceManager: APIServiceProtocol = APIService()) {
        self.serviceManager = serviceManager
    }

    func fetchRestaurants(_ completion: @escaping ([RestaurantsListModel]) -> Void) {
		serviceManager.get(request: Router.fetchRestaurants.getRequest,
						   of: [RestaurantsListModel].self) { result in
			switch result {
			case .success(let restaurantList):
				completion(restaurantList)
			case .failure:
				completion([])
			}
		}
    }

    func searchAddresses(_ completion: ([String]) -> Void) {

        completion(["Address 1", "Address 2", "Address 3"])
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: @escaping ([RestaurantItem]) -> Void) {
           serviceManager.get(request: Router.fetchMenuItem.getRequest, of: RestaurantsListModel.self) { result in
               switch result {
               case .success(let restaurantDetails):
                   completion(restaurantDetails.menu)
               case .failure:
                   completion([])
               }
           }
    }
}
