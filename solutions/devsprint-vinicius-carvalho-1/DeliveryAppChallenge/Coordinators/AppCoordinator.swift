//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 28/01/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        presenter.pushViewController(viewController, animated: false)
    }
    
    func goToSettings() {
        let child = SettingsCoordinator(presenter: presenter)
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
