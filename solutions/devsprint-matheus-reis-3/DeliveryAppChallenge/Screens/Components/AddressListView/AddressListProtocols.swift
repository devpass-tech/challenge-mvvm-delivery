//
//  AddressListProtocols.swift
//  DeliveryAppChallenge
//
//  Created by Vitor Conceicao on 11/08/22.
//

import Foundation

protocol AddressListDataSource: AnyObject {
    var count: Int { get }
    func getAddressViewModel(at indexPath: IndexPath) -> AddressCellViewModel
}
