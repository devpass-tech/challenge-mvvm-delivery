//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 18/05/22.
//

import Foundation

class AddressSearchViewModel {
    
    private var service: DeliveryApi
    
    private var addresses: [Address] = []
    
    init(service: DeliveryApi) {
        self.service = service
    }
    
    func getAddressesList(completion: @escaping () -> Void) {
        service.searchAddresses { result in
            switch result {
            case .success(let addresses):
                self.addresses = addresses
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension AddressSearchViewModel: AddressesListViewDataSource {
    
    func getItemCount() -> Int {
        return addresses.count
    }
    
    func getData(at: Int) -> Address {
        return addresses[at]
    }
}
