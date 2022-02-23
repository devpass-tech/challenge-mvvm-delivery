//
//  Coordinator.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 21/02/22.
//

import UIKit

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    var childCoordinator: [Coordinator] {get set}
    var parentCoordinator: Coordinator? { get set }
    
    func star()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
    func back()
    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
 
       // MARK: Methods
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter({$0 !== coordinator})
    }
    
    func back() {}
    
    func childDidFinish(_ child: Coordinator?) {
        guard let child = child else {return}
        remove(childCoordinator: child)
    }
}
