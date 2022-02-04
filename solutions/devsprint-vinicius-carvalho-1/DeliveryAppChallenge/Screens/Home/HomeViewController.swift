//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {
        
    var viewModel: HomeViewModelType = HomeViewModel()

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(routeToSettings))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
		let view = HomeView()
		view.restaurantListView.delegate = self
		self.view = view
    }
    
    @objc func routeToSettings(_ sender: UITapGestureRecognizer) {
        viewModel.coordinator?.goToSettings()
    }
}

extension HomeViewController: RestaurantListDelegate {
	func didSelectGoToRestaurantDetails(row: Int) {
		viewModel.coordinator?.goToDetails()
	}
}
