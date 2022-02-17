//
//  RestaurantListViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 16/02/22.
//

import Foundation

protocol RestuarantListPresentable: AnyObject {
    func reloadData()
    func presentError(title: String, message: APIError)
}

class RestaurantListViewModel {
    
    let delegate: DeliveryApiProtocol? = DeliveryApi()
    var delegatePresentable: RestuarantListPresentable? = nil
    var model: [RestaurantModel]?
    
    func load() {
        delegate?.fetchRestaurants({ model in
            switch model {
            case .success(let restaurant):
                self.model = restaurant
                self.delegatePresentable?.reloadData()
            case .failure(let error):
                self.delegatePresentable?.presentError(title: "Algo deu errado", message: error)
            }
        })
    }
    
    func numberOfRow()-> Int {
        return model?.count ?? 0
    }
    
    func cellForRow(indexPath: IndexPath) -> RestaurantModel {
        return model?[indexPath.row] ?? RestaurantModel(name: "", category: "", deliveryTime: DeliveryTime(min: 0, max: 0))
    }
}
