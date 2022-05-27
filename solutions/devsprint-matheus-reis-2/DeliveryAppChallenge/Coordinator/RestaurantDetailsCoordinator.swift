//
//  RestaurantDetailsCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 27/05/22.
//

import Foundation
import UIKit

final class RestaurantDetailsCoordinator: Coordinator {
    
    var presenter: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewModel = RestaurantDetailsViewModel(service: DeliveryApi())
        viewModel.coordinator = self
        let viewController = RestaurantDetailsViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: true)
    }
    
    func onFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
