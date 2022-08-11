//
//  AddressSearchProtocols.swift
//  DeliveryAppChallenge
//
//  Created by Vitor Conceicao on 10/08/22.
//

import Foundation

protocol AddressSearchViewModelProtocol {
    func fetchAddresses()
    func getAddress(at indexPath: IndexPath) -> AddressCellViewModel
    func searchAddress(text: String)
}

protocol AddressSearchViewModelDelegate: AnyObject {
    func didLoadAddresses()
    func didFailLoadAddresses(error: String)
}
