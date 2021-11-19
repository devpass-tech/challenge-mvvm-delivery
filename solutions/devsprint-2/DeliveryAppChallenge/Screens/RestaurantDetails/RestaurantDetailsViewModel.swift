//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Murillo R. Araújo on 11/11/21.
//

import Foundation

protocol RestaurantDetailsPresentable: AnyObject {
    func displayRestaurantDetails(with restaurantDetails: RestaurantDetails)
    func displayErros(error: Error)
}

class RestaurantDetailsViewModel {
    let service: APIManagerProtocol
    
    weak var presenter: RestaurantDetailsPresentable?
    
    init(with service: APIManagerProtocol = APIManager()) {
        self.service = service
    }
    
    func loadRestaurantDetails() {
        
        let apiURl = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/restaurant_details.json"
        
        service.performRequest(pathURL: apiURl, method: .get) { (result: Result<RestaurantDetails, APIError>) in
            switch result {
            case .success(let restaurantDetails):
                self.presenter?.displayRestaurantDetails(with: restaurantDetails)
                
            case .failure(let error):
                self.presenter?.displayErros(error: error)
            }
        }
    }
}
