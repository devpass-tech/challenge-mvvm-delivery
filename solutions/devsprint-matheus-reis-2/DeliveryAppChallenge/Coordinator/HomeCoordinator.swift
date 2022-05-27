//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 24/05/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = HomeViewModel(service: DeliveryApi())
        viewModel.coordinator = self
        let viewController = HomeViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: true)
    }
}
