//
//  HomeViewCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 21/02/22.
//

import UIKit

class HomeViewCoordinator: Coordinator {
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
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
