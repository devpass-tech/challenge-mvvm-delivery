//
//  DetailCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Cátia Souza on 17/11/21.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = RestaurantDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

