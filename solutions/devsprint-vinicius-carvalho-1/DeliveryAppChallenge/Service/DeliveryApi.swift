//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

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

    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        serviceManager.get(request: Router.fetchAddress.getRequest, of: [Address].self) { result in
            switch result {
            case .success(let addressList):
                completion(.success(addressList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: (String) -> Void) {

        completion("Menu Item")
    }
}
