//
//  RestaurantDetailsViewModelType.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 04/02/22.
//

import Foundation

protocol RestaurantDetailsViewModelType: Coordinatable {
	var coordinator: RestaurantDetailsCoordinator? { get set }
}
