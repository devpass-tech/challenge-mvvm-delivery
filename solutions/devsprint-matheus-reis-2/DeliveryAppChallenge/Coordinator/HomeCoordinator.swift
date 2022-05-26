//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 26/05/22.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        
        let viewModel = HomeViewModel(service: DeliveryApi())
        viewModel.coordinator = self
        let viewController = HomeViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: false)
    }
    
    func onFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
