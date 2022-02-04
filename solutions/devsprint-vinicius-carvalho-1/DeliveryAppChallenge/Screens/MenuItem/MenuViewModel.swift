//
//  MenuViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 04/02/22.
//

import Foundation

class MenuViewModel: MenuViewModelType {	
	var coordinator: MenuItemCoordinator?

	func onFinish() {
		coordinator?.onFinish()
	}
}
