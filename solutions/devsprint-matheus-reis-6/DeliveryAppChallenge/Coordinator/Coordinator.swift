//
//  Coordinator.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 25/01/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinator: AppCoordinator? { get set }
    func start()
    func finish()
}
