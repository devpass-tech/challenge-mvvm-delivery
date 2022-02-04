//
//  MenuViewModelType.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 04/02/22.
//

import Foundation

protocol MenuViewModelType: Coordinatable {
	var coordinator: MenuItemCoordinator? { get set }
}
