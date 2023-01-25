//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 25/01/23.
//

import Foundation
import UIKit

final class AppCoordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let childCoordinator: Coordinator = HomeCoordinator(navigationController: navigationController)
        
        addChild(childCoordinator)
        
        childCoordinator.start()
    }
    
    func addChild(_ child: Coordinator) {
        child.parentCoordinator = self
        childCoordinators.append(child)
    }
    
    func removeChild(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
            }
        }
    }
}
