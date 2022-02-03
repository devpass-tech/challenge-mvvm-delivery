//
//  HomeViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Guilherme Prata Costa on 31/01/22.
//

import Foundation

class HomeViewModel: HomeViewModelType {
    
    var coordinator: HomeCoordinator?
    
    func onFinish() {
        coordinator?.onFinish()
    }

}
