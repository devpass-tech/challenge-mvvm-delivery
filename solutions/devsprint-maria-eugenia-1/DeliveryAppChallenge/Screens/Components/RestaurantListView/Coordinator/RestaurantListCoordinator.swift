//
//  RestaurantListCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 21/02/22.
//

import UIKit

class RestaurantListCoordinator {
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = false
    }
    
    // MARK: Methods
    func star() {
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goTableView() {
        let vc  = RestaurantDetailsViewController()
        navigationController.pushViewController(vc, animated: true)
        star()
    }
    
    func childDidFinish(_ child: Coordinator) {
//        parentCoordinator?.childDidFinish(self)
    }
}
