//
//  DataSourceUserDefaultsProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

protocol DataSourceUserDefaultsProtocol {
	static func add(with data: Any)
	static func get() -> Any?
	static func delete()
}

struct Keys {
	static let Payment = "payment-method"
	static let Email = "user-email"
	static let Name = "user-name"
	static let Address = "address"
}
