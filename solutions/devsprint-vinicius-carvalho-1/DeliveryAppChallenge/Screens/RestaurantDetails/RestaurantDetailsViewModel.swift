//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Murillo R. Araújo on 29/01/22.
//

import Foundation

protocol RestaurantDetailsPresentable: AnyObject {
    func displayRestaurantDetails(with restaurant: Restaurant)
    func displayError(error: Error)
}

class RestaurantDetailsViewModel: RestaurantDetailsViewModelType {

	var coordinator: RestaurantDetailsCoordinator?
	
    let service: APIServiceProtocol
	
    weak var presenter: RestaurantDetailsPresentable?

    init(with service: APIServiceProtocol = APIService()) {
        self.service = service
    }

    func loadRestaurantDetails() {

        service.get(request: Router.fetchRestaurantDetails.getRequest, of: Restaurant.self ) { (result: Result<Restaurant, ServiceError>) in
            switch result {
            case .success(let restaurant):
                self.presenter?.displayRestaurantDetails(with: restaurant)

            case .failure(let error):
                self.presenter?.displayError(error: error)
            }
        }
    }
	
	func onFinish() {
		coordinator?.onFinish()
	}
}
