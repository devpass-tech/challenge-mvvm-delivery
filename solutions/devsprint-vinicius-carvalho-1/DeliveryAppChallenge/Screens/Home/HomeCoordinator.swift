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

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.
        presenter.pushViewController(homeViewController, animated: false)
    }

}

