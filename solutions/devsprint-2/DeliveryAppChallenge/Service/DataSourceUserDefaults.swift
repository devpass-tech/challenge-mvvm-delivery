//
//  DataSourceUserDefaults.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 11/11/21.
//

import Foundation

enum Keys: String {
	case payment = "payment-method"
	case email = "user-email"
	case name = "user-name"
	case address = "address"
}

class DataSourceUserDefaults {
		
	static func addValue(with value: Any, forKey: Keys) {
		UserDefaults.standard.set(value, forKey: forKey.rawValue)
	}
	
	static func getValue(with forKey: Keys) -> Any? {
		return UserDefaults.standard.object(forKey: forKey.rawValue)
	}
	
	static func deleteValue(with forKey: Keys) {
		UserDefaults.standard.removeObject(forKey: forKey.rawValue)
	}

}
