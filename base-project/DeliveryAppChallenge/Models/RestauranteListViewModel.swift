//
//  RestauranteListViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Cátia Souza on 17/11/21.
//

import Foundation

protocol Presentable {
    func presentNewScreen()
}

class HomeViewModel {
    var presenter: Presentable?
    
    func didTapNextButton() {
        presenter?.presentNewScreen()
    }
    
}
