//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        let homeView = HomeView()
        homeView.delegate = self
        self.view = homeView
    }
}

extension HomeViewController: HomeViewDelegate {
    func goToDetailListRestaurant() {
        guard let navigation = self.navigationController else  { return }
        let delegate: RestaurantListCoordinator = RestaurantListCoordinator(navigationController: navigation)
        delegate.goTableView()
        
    }
}
