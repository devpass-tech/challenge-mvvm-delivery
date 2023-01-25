//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 25/01/23.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = DeliveryApi(network: NetworkManager<DeliveryRequest>())
        let viewModel = HomeViewModel(service: service)
        viewModel.coordinator = self
        
        let controller = HomeViewController(viewModel: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func goToRestaurantDetails() {
        let coordinator = RestaurantDetailsCoordinator(navigationController: navigationController)
        
        parentCoordinator?.addChild(coordinator)
        
        coordinator.start()
    }
}
