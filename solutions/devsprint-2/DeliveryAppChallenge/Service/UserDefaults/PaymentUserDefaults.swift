//
//  PaymentUserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

class PaymentUserDefaults: DataSourceUserDefaultsProtocol {
		
	static func add(with value: Any) {
		UserDefaults.standard.set(value, forKey: Keys.Payment)
	}
	
	static func get() -> Any? {
		return UserDefaults.standard.object(forKey: Keys.Payment)
	}
	
	static func delete() {
		UserDefaults.standard.removeObject(forKey: Keys.Payment)
	}

}
