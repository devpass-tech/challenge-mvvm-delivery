//
//  MockUserDefaults.swift
//  DeliveryAppChallengeTests
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation
import UIKit
@testable import DeliveryAppChallenge

class MockUserDefaults: DataSourceUserDefaultsProtocol {
	
	static func add(with value: Any) {
		UserDefaults.standard.set(value, forKey: "mock")
	}
	
	static func get() -> Any? {
		return UserDefaults.standard.object(forKey: "mock")
	}
	
	static func delete() {
		UserDefaults.standard.removeObject(forKey: "mock")
	}
	
}
