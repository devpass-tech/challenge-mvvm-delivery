//
//  Coordinator.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 28/01/22.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var presenter: UINavigationController { get set }
    
    func start()
}
