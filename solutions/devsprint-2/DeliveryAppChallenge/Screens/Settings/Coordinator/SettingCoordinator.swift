//
//  SettingCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Pedro Henrique on 17/11/21.
//

import UIKit

class SettingCoordinator: Coordinator {
    
    let viewController: UIViewController?

    init(viewController: UIViewController?) {
        self.viewController = viewController
    }
    
    func start() {
        let vc = SettingsViewController()
        viewController?.present(vc, animated: true, completion: nil)
    }
}
