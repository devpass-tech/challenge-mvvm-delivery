//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

struct DeliveryApi {

    var serviceManager: APIServiceProtocol

    init(serviceManager: APIServiceProtocol = APIService()) {
        self.serviceManager = serviceManager
    }

    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void) {
		serviceManager.get(request: Router.fetchRestaurants.getRequest,
						   of: [Restaurant].self) { result in
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

	func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetailsModel?) -> Void) {

		serviceManager.get(request: Router.fetchRestaurantDetails.getRequest,
						   of: RestaurantDetailsModel.self) { result in
			switch result {
			case .success(let restaurantDetails):
				completion(restaurantDetails)
			case .failure(_):
				completion(nil)
			}
		}
	}

    func fetchMenuItem(_ completion: @escaping ([RestaurantItem]) -> Void) {
        serviceManager.get(request: Router.fetchMenuItem.getRequest, of: Restaurant.self) { result in
            switch result {
            case .success(let restaurantDetails):
                   completion(restaurantDetails.menu)
            case .failure:
                   completion([])
            }
        }
    }
}
