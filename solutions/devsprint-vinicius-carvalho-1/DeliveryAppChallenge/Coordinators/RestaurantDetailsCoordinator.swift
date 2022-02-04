//
//  RestaurantDetailsCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 04/02/22.
//

import Foundation
import UIKit


final class RestaurantDetailsCoordinator: Coordinator {
	
	var childCoordinators = [Coordinator]()
	var presenter: UINavigationController
	weak var parentCoordinator: AppCoordinator?
	
	init(presenter: UINavigationController) {
		self.presenter = presenter
	}
	
	func start() {
		let viewController = RestaurantDetailsViewController()
		viewController.viewModel.coordinator = self
		presenter.pushViewController(viewController, animated: true)
	}
	
	func goToMenuItem() {
		let child = MenuItemCoordinator(presenter: presenter)
		child.parentCoordinator = parentCoordinator
		childCoordinators.append(child)
		child.start()
	}
	
	func onFinish() {
		parentCoordinator?.childDidFinish(self)
	}
	
}
