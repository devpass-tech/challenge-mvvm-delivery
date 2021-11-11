//
//  AddressUserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

class AddressUserDefaults: DataSourceUserDefaultsProtocol {
	
	static func add(with value: Any) {
		UserDefaults.standard.set(value, forKey: Keys.Address)
	}
	
	static func get() -> Any? {
		return UserDefaults.standard.object(forKey: Keys.Address)
	}
	
	static func delete() {
		UserDefaults.standard.removeObject(forKey: Keys.Address)
	}
	
}
