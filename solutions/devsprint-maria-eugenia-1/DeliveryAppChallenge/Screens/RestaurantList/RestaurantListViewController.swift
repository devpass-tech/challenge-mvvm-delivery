//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantListViewController: UIViewController {
    var listViewDelegate: RestaurantListViewDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Restaurant List"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.listViewDelegate = self
    }
    
    override func loadView() {
        self.view = RestaurantListView()
    }
}


extension RestaurantListViewController: RestaurantListViewDelegate {
    func pushViewController() {
        guard let navigation = self.navigationController else { return }
        let delegate: RestaurantListCoordinator = RestaurantListCoordinator(navigationController: navigation)
        delegate.goTableView()
    }
}
