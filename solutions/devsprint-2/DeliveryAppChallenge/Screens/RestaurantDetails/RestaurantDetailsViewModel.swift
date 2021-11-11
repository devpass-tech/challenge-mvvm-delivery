//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Murillo R. Araújo on 11/11/21.
//

import Foundation

protocol RestaurantDetailsViewModelDelegate: AnyObject {
    func displayRestaurantDetails(with restaurantDetails: RestaurantDetails)
    func displayErros(error: Error)
}

class RestaurantDetailsViewModel {
    private let service = APIManager()
        
    weak var delegate: RestaurantDetailsViewModelDelegate?
    
    func loadRestaurantDetails() {
        
        let apiURl = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/restaurant_details.json"
        
        service.performRequest(pathURL: apiURl, method: .get) { (result: Result<RestaurantDetails, APIError>) in
            switch result {
            case .success(let restaurantDetails):
                self.delegate?.displayRestaurantDetails(with: restaurantDetails)
                
            case .failure(let error):
                self.delegate?.displayErros(error: error)
            }
        }
    }
}
