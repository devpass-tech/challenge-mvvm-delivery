//
//  SettingCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Pedro Henrique on 17/11/21.
//

import UIKit

class SettingCoordinator: Coordinator {
    
    let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
