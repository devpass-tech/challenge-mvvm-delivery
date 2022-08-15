//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Vitor Conceicao on 10/08/22.
//

import Foundation

final class AddressSearchViewModel: AddressSearchViewModelProtocol {
    
    private let service: DeliveryApiProtocol
    weak var delegate: AddressSearchViewModelPresentable?
    
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
                self?.addressesViewModels = self?.createAddressesCellViewModels(addresses: addresses) ?? []
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
    
    func searchAddress(text: String = "") {
        if text.isEmpty {
            addressesViewModels = createAddressesCellViewModels(addresses: addresses)
            return
        }
        
        let filteredAddresses = addresses.filter { address in
            address.street.lowercased().contains(text.lowercased()) || address.neighborhood.lowercased().contains(text.lowercased())
        }
        
        addressesViewModels = createAddressesCellViewModels(addresses: filteredAddresses)
    }
    
    private func createAddressesCellViewModels(addresses: [Address]) -> [AddressCellViewModel] {
        var addressesViewModels: [AddressCellViewModel] = []
        for address in addresses {
            addressesViewModels.append(AddressCellViewModel(title: "\(address.street), \(address.number)",
                                        subtitle: address.neighborhood))
        }
        return addressesViewModels
    }
}
