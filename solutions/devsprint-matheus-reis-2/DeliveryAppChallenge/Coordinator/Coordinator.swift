//
//  Coordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 24/05/22.
//

import UIKit

protocol Coordinator: AnyObject {

    var presenter: UINavigationController { get set }
    var parentCoordinator: AppCoordinator? { get set }
    
    func start()
}
