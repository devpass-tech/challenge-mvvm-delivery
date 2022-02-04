//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Amaryllis Baldrez on 03/02/22.
//

import Foundation

protocol AddressSearchPresentable: AnyObject {
    func displayAddresses(with address: Address)
    func displayError(error: Error)
}

class AddressSearchViewModel {
    let service: APIServiceProtocol
    let enderecos = ["Rua do Chaves", "Rua do Kiko"]

    weak var presenter: AddressSearchPresentable?

    init(with service: APIServiceProtocol = APIService()) {
        self.service = service
    }

    func loadSearchAddress() {

        service.get(request: Router.fetchAddress.getRequest, of: Address.self ) { (result: Result<Address, ServiceError>) in
            switch result {
            case .success(let address):
                self.presenter?.displayAddresses(with: address)

            case .failure(let error):
                self.presenter?.displayError(error: error)
            }
        }
    }
}
