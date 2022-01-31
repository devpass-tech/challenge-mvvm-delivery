//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 28/01/22.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
                
    }
    
    func start() {
        let viewController = SettingsViewController()
        viewController.coordinator = self
        presenter.pushViewController(viewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }

}
