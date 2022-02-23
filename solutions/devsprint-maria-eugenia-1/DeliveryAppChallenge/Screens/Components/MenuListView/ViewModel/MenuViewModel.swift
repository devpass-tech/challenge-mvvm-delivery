//
//  MenuViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Francischett Occhiuto on 21/02/22.
//

import Foundation

protocol MenuPresentable: AnyObject {
    func reloadData()
    func presentError(title: String, message: APIError)
}

class MenuViewModel {
    
    let delegate: DeliveryApiProtocol? = DeliveryApi()
    weak var delegatePresentable: MenuPresentable?
    var model: [Menu]?
    
    func load() {
        delegate?.fetchRestaurantDetails({ model in
            switch model {
            case .success(let restaurantDetails):
                self.model = restaurantDetails?.menu ?? []
                self.delegatePresentable?.reloadData()
            case .failure(let error):
                self.delegatePresentable?.presentError(title: "Algo deu errado", message: error)
            }
        })
    }
    
    func numberOfRow()-> Int {
        return model?.count ?? 0
    }
    
    func cellForRow(indexPath: IndexPath) -> Menu {
        return model?[indexPath.row] ?? Menu(category: "", name: "", price: 0.0)
    }
}
