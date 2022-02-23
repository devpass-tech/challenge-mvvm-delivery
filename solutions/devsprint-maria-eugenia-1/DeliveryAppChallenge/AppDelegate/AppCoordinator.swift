//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 21/02/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    // MARK: - Super Methods
    init() {
        navigationController = UINavigationController()
    }
    
    // MARK: Methods
    func star() {
        let childCoordinator = HomeViewCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.star()
    }
    
    func childDidFinish(_ child: Coordinator) {
        parentCoordinator?.childDidFinish(self)
    }
}
