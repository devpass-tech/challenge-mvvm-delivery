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
            var vc: UIViewController & Coordinating = SettingsViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = HomeViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
}
