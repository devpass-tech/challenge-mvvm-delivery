//
//  HomeViewModelType.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 31/01/22.
//

import Foundation

protocol HomeViewModelType: Coordinatable {
    var coordinator: HomeCoordinator? { get set }
}
