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
        self.view = RestaurantDetailsView()
    }
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		viewModel.coordinator?.onFinish()
	}
}
