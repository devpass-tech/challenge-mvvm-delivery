//
//  APIManagerTestCase.swift
//  DeliveryAppChallengeTests
//
//  Created by Alexandre Cardoso on 09/11/21.
//

import XCTest
@testable import DeliveryAppChallenge

class APIManagerTestCase: XCTestCase {
	
	var sut: APIManagerMock!
	
	override func setUp() {
		sut = APIManagerMock()
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
		sut = nil
	}

	func testAPICallWithErrorNetwork() {
		sut.errorAPI = .errorNetwork
		var resultExpected: RestaurantDetails?
		var errorExpected: APIError?
		let expectation = self.expectation(description: "waiting")
		
		sut.performRequest(pathURL: "", method: .get) { (result: Result<RestaurantDetails, APIError>) in
			switch result {
				case .success(let detail):
					resultExpected = detail
				case .failure(let error):
					errorExpected = error
			}
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 3, handler: nil)
		
		XCTAssertNotNil(errorExpected)
		XCTAssertNil(resultExpected)
		XCTAssertEqual(sut.errorAPI, errorExpected)
	}
	
	func testAPICallWithNoData() {
		sut.errorAPI = .noData
		var resultExpected: RestaurantDetails?
		var errorExpected: APIError?
		let expectation = self.expectation(description: "waiting")
		
		sut.performRequest(pathURL: "", method: .get) { (result: Result<RestaurantDetails, APIError>) in
			switch result {
				case .success(let detail):
					resultExpected = detail
				case .failure(let error):
					errorExpected = error
			}
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 3, handler: nil)
		
		XCTAssertNotNil(errorExpected)
		XCTAssertNil(resultExpected)
		XCTAssertEqual(sut.errorAPI, errorExpected)
	}
	
	func testAPICallWithParseError() {
		sut.errorAPI = .parseError
		var resultExpected: RestaurantDetails?
		var errorExpected: APIError?
		let expectation = self.expectation(description: "waiting")
		
		sut.performRequest(pathURL: "", method: .get) { (result: Result<RestaurantDetails, APIError>) in
			switch result {
				case .success(let detail):
					resultExpected = detail
				case .failure(let error):
					errorExpected = error
			}
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 3, handler: nil)
		
		XCTAssertNotNil(errorExpected)
		XCTAssertNil(resultExpected)
		XCTAssertEqual(sut.errorAPI, errorExpected)
	}
	
	func testAPICallWithInvalidURL() {
		sut.errorAPI = .invalidURL
		var resultExpected: RestaurantDetails?
		var errorExpected: APIError?
		let expectation = self.expectation(description: "waiting")
		
		sut.performRequest(pathURL: "", method: .get) { (result: Result<RestaurantDetails, APIError>) in
			switch result {
				case .success(let detail):
					resultExpected = detail
				case .failure(let error):
					errorExpected = error
			}
			expectation.fulfill()
		}
		
		waitForExpectations(timeout: 3, handler: nil)
		
		XCTAssertNotNil(errorExpected)
		XCTAssertNil(resultExpected)
		XCTAssertEqual(sut.errorAPI, errorExpected)
	}
	
	func testAPICallWithSuccess() {
		sut.errorAPI = nil
		var resultExpected: RestaurantDetails?
		var errorExpected: APIError?
		let expectation = self.expectation(description: "waiting")

		sut.performRequest(pathURL: "", method: .get) { (result: Result<RestaurantDetails, APIError>) in
			switch result {
				case .success(let detail):
					resultExpected = detail
				case .failure(let error):
					errorExpected = error
			}
			expectation.fulfill()
		}

		waitForExpectations(timeout: 3, handler: nil)

		XCTAssertNotNil(resultExpected)
		XCTAssertNil(errorExpected)
		XCTAssertEqual(resultExpected?.name, "Benjamin A Padaria")
		XCTAssertEqual(resultExpected?.menu.count, 2)
	}

}
