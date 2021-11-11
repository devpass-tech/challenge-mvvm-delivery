//
//  UserDefaultsTestCase.swift
//  DeliveryAppChallengeTests
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import XCTest

class UserDefaultsTestCase: XCTestCase {

	func testAddValueInUserDefaults() {
		let valueExpected = "Test-Add"
		MockUserDefaults.add(with: valueExpected)
		
		XCTAssertEqual(MockUserDefaults.get() as? String, valueExpected)
		makeDeleteTest()
	}
	
	func testGetValueInUserDefaults() {
		let valueExpected = makeAddTest()
		
		XCTAssertEqual(MockUserDefaults.get() as? String, valueExpected)
		makeDeleteTest()
	}
	
	func testDeleteValueInUserDefaults() {
		let _ = makeAddTest()
		MockUserDefaults.delete()
		
		XCTAssertEqual(MockUserDefaults.get() as? String, nil)
	}
	
}

extension UserDefaultsTestCase {
	
	func makeDeleteTest() {
		MockUserDefaults.delete()
	}
	
	func makeAddTest() -> String {
		let value = "Test-Add"
		MockUserDefaults.add(with: value)
		return value
	}
	
}
