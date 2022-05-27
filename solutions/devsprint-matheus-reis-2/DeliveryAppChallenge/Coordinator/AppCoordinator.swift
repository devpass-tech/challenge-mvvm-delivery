//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 24/05/22.
//

import UIKit

final class AppCoordinator {
    
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let child = HomeCoordinator(presenter: presenter)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
            }
        }
    }
}

