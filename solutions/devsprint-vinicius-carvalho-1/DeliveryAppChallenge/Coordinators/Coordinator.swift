//
//  Coordinator.swift
//  DeliveryAppChallenge
//
//  Created by Thyago Raphael on 1/26/22.
//

import UIKit

enum Event {
    case buttonTappedSettings
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
