//
//  EmailUserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

class EmailUserDefaults: DataSourceUserDefaultsProtocol {
		
	static func add(with value: Any) {
		UserDefaults.standard.set(value, forKey: Keys.Email)
	}
	
	static func get() -> Any? {
		return UserDefaults.standard.object(forKey: Keys.Email)
	}
	
	static func delete() {
		UserDefaults.standard.removeObject(forKey: Keys.Email)
	}

}
