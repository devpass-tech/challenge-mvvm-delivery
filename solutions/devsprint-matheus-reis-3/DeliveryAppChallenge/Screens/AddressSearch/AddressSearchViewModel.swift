//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Vitor Conceicao on 10/08/22.
//

import Foundation

final class AddressSearchViewModel: AddressSearchViewModelProtocol {
    
    private let service: DeliveryApiProtocol
    weak var delegate: AddressSearchViewModelDelegate?
    
    private var addresses: [Address] = []
    private var addressesViewModels: [AddressCellViewModel] = []
    var count: Int {
        addressesViewModels.count
    }
    
    init(service: DeliveryApiProtocol = DeliveryApi()) {
        self.service = service
    }
    
    func fetchAddresses() {
        service.fetchSearchAddresses {[weak self] result in
            switch result {
            case .success(let addresses):
                self?.addresses = addresses
                for address in addresses {
                    guard let addressViewModel = self?.createAddressCellViewModel(address: address)
                    else {
                        return
                    }
                    
                    self?.addressesViewModels.append(addressViewModel)
                }
                DispatchQueue.main.async {
                    self?.delegate?.didLoadAddresses()
                }
            case .failure(let error):
                self?.delegate?.didFailLoadAddresses(error: error.localizedDescription)
            }
        }
    }
    
    func getAddress(at indexPath: IndexPath) -> AddressCellViewModel {
        return addressesViewModels[indexPath.row]
    }
    
    private func createAddressCellViewModel(address: Address) -> AddressCellViewModel {
        return AddressCellViewModel(title: "\(address.street), \(address.number)",
                                    subtitle: address.neighborhood)
    }
}
