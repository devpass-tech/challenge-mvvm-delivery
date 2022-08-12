//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Eduardo Matheus Oliveira de Córdova on 06/08/22.
//

import Foundation

protocol RestaurantDetailsViewPresentable: AnyObject {
    func reloadList()
}

final class RestaurantDetailsViewModel{
    
    private let service: DeliveryApiProtocol
    
    public var restaurantDetails: RestaurantDetails?
    weak var presenter: RestaurantDetailsViewPresentable?
    
    init(service: DeliveryApiProtocol) {
        self.service = service
    }
    
    public func fetchRestaurantDetails(completion: @escaping (RestaurantDetails) -> Void){
        service.fetchRestaurantDetails { result in
            switch result{
            case .success(let restaurant) :
                completion(restaurant)
                self.presenter?.reloadList()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RestaurantDetailsViewModel: RestaurantDetailsViewDataSource {
    func getRestaurantMenuList() -> [RestaurantMenuItem] {
        return restaurantDetails?.menuItens ?? []
    }
}
