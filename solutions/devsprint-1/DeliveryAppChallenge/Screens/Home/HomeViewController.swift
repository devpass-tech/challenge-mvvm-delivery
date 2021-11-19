//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

// MARK: - HomeViewController

class HomeViewController: UIViewController {
    
    // MARK: Lifecycle
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

        RestaurantsViewModel()
    }

    override func loadView() {
        let home = HomeView()
        home.setupCellViewDelegate(delegate: self)
        self.view = home
    }
}

extension HomeViewController: CategoryCellViewProtocolDelegate {
    func imageTapped() {
        let vc = RestaurantListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
