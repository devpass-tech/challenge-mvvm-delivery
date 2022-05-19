//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 18/05/22.
//

import Foundation

class AddressSearchViewModel {
    
    private var enderecos: [Address] = []
    
    func fetchAddresses() {
        let chamada = DeliveryApi()
        chamada.searchAddresses(UrlName.addressesList) { result in
            switch result {
            case .success(let sucess):
                print("ok")
            case .failure(let falha):
                print("falha")
            }
            }
        }
    }
    
