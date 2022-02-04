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

    private let service: DeliveryApiService
	var coordinator: RestaurantDetailsCoordinator?
	
    weak var presenter: RestaurantDetailsPresentable?

    init(with service: DeliveryApiService = DeliveryServiceImplementation()) {
        self.service = service
    }

    func loadRestaurantDetails() {
        service.fetchRestaurantDetails { result in
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
