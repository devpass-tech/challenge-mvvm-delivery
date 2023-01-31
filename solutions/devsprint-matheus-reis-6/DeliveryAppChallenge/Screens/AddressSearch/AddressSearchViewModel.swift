//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 26/01/23.
//

import Foundation

protocol AddressSearchViewModelProtocol {
    var addresses: [Address] { get }
    func fetch(completion: @escaping () -> ())
}

final class AddressSearchViewModel: AddressSearchViewModelProtocol {
    
    private var service: DeliveryApi
    
    var addresses: [Address] = []
    
    init(service: DeliveryApi) {
        self.service = service
    }
    
    func fetch(completion: @escaping () -> ()) {
        service.searchAddresses { (address) in
            self.addresses = address
            completion()
        }
    }
}
