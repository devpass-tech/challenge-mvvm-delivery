//
//  MenuItemCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 04/02/22.
//

import UIKit

final class MenuItemCoordinator: Coordinator {
	
	var childCoordinators = [Coordinator]()
	var presenter: UINavigationController
	weak var parentCoordinator: AppCoordinator?
	
	init(presenter: UINavigationController) {
		self.presenter = presenter
	}
	
	func start() {
		let viewController = MenuItemViewController()
		viewController.viewModel.coordinator = self
		viewController.modalPresentationStyle = .overCurrentContext
		 viewController.modalTransitionStyle = .crossDissolve
		presenter.pushViewController(viewController, animated: true)
	}
	
	func onFinish() {
		parentCoordinator?.childDidFinish(self)
	}
	
	
}
