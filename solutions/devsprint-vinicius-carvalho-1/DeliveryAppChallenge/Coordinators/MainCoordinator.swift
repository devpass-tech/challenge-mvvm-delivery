//
//  MainCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Thyago Raphael on 1/29/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {

    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTappedSettings:
            var viewController: UIViewController & Coordinating = SettingsViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func start() {
        var viewController: UIViewController & Coordinating = HomeViewController()
        viewController.coordinator = self
        navigationController?.setViewControllers([viewController], animated: true)
    }
}
