//
//  DeliveryApiTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import XCTest
@testable import DeliveryAppChallenge


class DeliveryApiTests: XCTestCase {

	// MARK: Subject under test
	var sut: DeliveryApi!

	class APIServiceSpy: APIServiceProtocol {

		var session: URLSession = {
			URLProtocolMock.mockSession(
				with: Router.fetchRestaurants.getRequest,
				completionMock: (nil,nil,nil)
			)
		}()

		var getCalled: Bool = false

		func get<T>(request: URLRequest, of type: T.Type, completion: @escaping (Result<T, ServiceError>) -> Void) where T : Decodable {
			getCalled = true
		}
	}

	// MARK: Test setup
	override func setUp() {
		super.setUp()
		self.sut = DeliveryApi()
	}

	override func tearDown() {
		super.tearDown()
		self.sut = nil
	}

	func test_fetchRestaurants_apiManagerCallsGet() {
		// Given
		let spy = APIServiceSpy()
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurants { _ in
			
		// Then
			XCTAssertTrue(spy.getCalled)
		}
	}

	private func encode(_ dataMock: [Restaurant]) -> Data {
		try! JSONEncoder().encode(dataMock)
	}

}
