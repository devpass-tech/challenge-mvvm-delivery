//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

// TODO: Use service abstraction
struct DeliveryApi {

	var serviceManager: APIServiceProtocol = APIService()

	/**
	 Fetch restaurants from API.

	 - Parameters:
	   - completion: a callback to receive the `[RestaurantListModel]` array.

	 Usage:
	 ```
	 let api = DeliveryApi()

	 api.fetchRestaurants { restaurants in
	   // do what you want with the restaurants array
	 }
	 ```
	*/
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

    func fetchMenuItem(_ completion: ([RestaurantItem]) -> Void) {
        guard let dataFromJson = Data.readData(from: "restaurant-details"),
              let restaurantDetails = try? JSONDecoder().decode(Restaurant.self, from: dataFromJson) else {
                  completion([])
                  return
              }
        completion(restaurantDetails.menu)
    }
}
