//
//  NameUserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

class NameUserDefaults: DataSourceUserDefaultsProtocol {
	
	static func add(with value: Any) {
		UserDefaults.standard.set(value, forKey: Keys.Name)
	}
	
	static func get() -> Any? {
		return UserDefaults.standard.object(forKey: Keys.Name)
	}
	
	static func delete() {
		UserDefaults.standard.removeObject(forKey: Keys.Name)
	}
	
}
