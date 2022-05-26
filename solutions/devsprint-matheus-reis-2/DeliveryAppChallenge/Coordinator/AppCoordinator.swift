//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 26/05/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let child = HomeCoordinator(presenter: presenter)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
