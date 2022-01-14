//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Murillo R. Araújo on 19/11/21.
//

import Foundation

protocol AddressSearchPresentable: AnyObject {
    func displayAddressSearch(with addresses: [Address])
    func displayErros(error: Error)
}

class AddressSearchViewModel {
    let service: APIManagerProtocol
    
    weak var presenter: AddressSearchPresentable?
    
    init(with service: APIManagerProtocol = APIManager()) {
        self.service = service
    }
    
    func loadAddressSearch() {
        
        let apiURl = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
        
        service.performRequest(pathURL: apiURl, method: .get) { (result: Result<[Address], APIError>) in
            switch result {
            case .success(let addresses):
                self.presenter?.displayAddressSearch(with: addresses)
                
            case .failure(let error):
                self.presenter?.displayErros(error: error)
            }
        }
    }
}
