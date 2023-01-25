//
//  RestaurantDetailsCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 25/01/23.
//

import Foundation
import UIKit

final class RestaurantDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = DeliveryApi(network: NetworkManager<DeliveryRequest>())
        
        let viewModel = RestaurantDetailsViewModel(service: service)
        viewModel.coordinator = self
        
        let controller = RestaurantDetailsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    func finish() {
        parentCoordinator?.removeChild(self)
    }
}
