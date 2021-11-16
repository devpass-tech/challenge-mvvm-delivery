//
//  DataSourceUserDefaultsTestCase.swift
//  DeliveryAppChallengeTests
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import XCTest
@testable import DeliveryAppChallenge

class DataSourceUserDefaultsTestCase: XCTestCase {
	
	func testAddValueInUserDefaults() {
		let valueExpected = "Test-Add"
		DataSourceUserDefaults.addValue(with: valueExpected, forKey: .name)
		
		XCTAssertEqual(DataSourceUserDefaults.getValue(with: .name) as? String, valueExpected)
		makeDeleteTest(forKey: .name)
	}
	
	func testGetValueInUserDefaults() {
		let valueExpected = makeAddTest(forKey: .email)
		
		XCTAssertEqual(DataSourceUserDefaults.getValue(with: .email) as? String, valueExpected)
		makeDeleteTest(forKey: .email)
	}
	
	func testDeleteValueInUserDefaults() {
		let _ = makeAddTest(forKey: .payment)
		DataSourceUserDefaults.deleteValue(with: .payment)
		
		XCTAssertEqual(DataSourceUserDefaults.getValue(with: .payment) as? String, nil)
	}
	
}

extension DataSourceUserDefaultsTestCase {
	
	func makeDeleteTest(forKey: Keys) {
		DataSourceUserDefaults.deleteValue(with: forKey)
	}
	
	func makeAddTest(forKey: Keys) -> String {
		let value = "Test Mock"
		DataSourceUserDefaults.addValue(with: value, forKey: forKey)
		return value
	}
	
}
