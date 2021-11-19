//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Murillo R. Araújo on 19/11/21.
//

import Foundation

protocol AddressSearchPresentable: AnyObject {
    func displayAddressSearch(with adresses: [Address])
    func displayErros(error: Error)
}

class AddressSearchViewModel {
    let service: APIManagerProtocol
    
    weak var presenter: AddressSearchPresentable?
    
    init(with service: APIManagerProtocol = APIManager()) {
        self.service = service
    }
    
    func loadRestaurantDetails() {
        
        let apiURl = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
        
        service.performRequest(pathURL: apiURl, method: .get) { (result: Result<[Address], APIError>) in
            switch result {
            case .success(let adresses):
                self.presenter?.displayAddressSearch(with: adresses)
                
            case .failure(let error):
                self.presenter?.displayErros(error: error)
            }
        }
    }
}
