//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 26/05/22.
//

import Foundation

final class RestaurantDetailsModel {
    
    private let service: DeliveryApiProtocol
    
    public var restaurantsDetail: [RestaurantDetail] = []
    
    init(service: DeliveryApiProtocol) {
        self.service = service
    }
    
    func getRestaurantDetails (completion: @escaping () -> Void) {
        service.fetchRestaurantDetails { (resut: Result<[RestaurantDetail], DeliveryApiError>) in
            switch resut {
            case .success(let restaurants):
                self.restaurantsDetail = restaurants
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RestaurantDetailsModel: MenuListViewDataSource {
    func getData(at: Int) -> RestaurantDetail {
        restaurantsDetail[at]
    }
    
    func getItemCount() -> Int {
        restaurantsDetail.count
    }
}
