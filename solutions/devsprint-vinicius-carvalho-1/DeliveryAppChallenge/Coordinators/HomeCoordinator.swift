//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 28/01/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.viewModel.coordinator = self
        presenter.pushViewController(viewController, animated: true)
    }
    
    func goToSettings() {
        let child = SettingsCoordinator(presenter: presenter)
        child.parentCoordinator = parentCoordinator
        childCoordinators.append(child)
        child.start()
    }
	
	func goToDetails() {
		let child = RestaurantDetailsCoordinator(presenter: presenter)
		child.parentCoordinator = parentCoordinator
		childCoordinators.append(child)
		child.start()
	}
    
    func onFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
