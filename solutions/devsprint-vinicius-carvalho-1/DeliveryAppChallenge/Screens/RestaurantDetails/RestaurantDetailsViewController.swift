//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
	
	var viewModel: RestaurantDetailsViewModel = RestaurantDetailsViewModel()

    override func loadView() {
		let view = RestaurantDetailsView()
		view.delegate = self
        self.view = view		
    }
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		viewModel.coordinator?.onFinish()
	}
}

extension RestaurantDetailsViewController: RestaurantDetailsDelegate {
	func didSelectGoToMenuItem() {
		viewModel.coordinator?.goToMenuItem()
	}
	
}
