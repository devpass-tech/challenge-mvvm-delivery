//
//  ServiceManagerTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

class ServiceManagerTests: XCTestCase {

	// MARK: Subject under test
	var sut: APIService!

	// MARK: Test setup
	override func setUp() {
		super.setUp()
		self.sut = APIService()
	}

	override func tearDown() {
		super.tearDown()
		self.sut = nil
		URLProtocolMock.urlRequests.removeAll()
	}

	func test_get_restaurants_success() {
		// Given
		let endpoint = Router.fetchRestaurants
		let dataMock = dataMock()
		let successCompletion = createResquestCompletionMock(
			endpoint: endpoint,
			dataMock: dataMock,
			statusCode: 200,
			error: nil
		)
		let mockSession = URLProtocolMock.mockSession(
			with: endpoint.getRequest,
			completionMock: successCompletion
		)
		self.sut = APIService(mockSession)

		let expectation = expectation(description: "success")

		// When
		sut.get(
			request: endpoint.getRequest,
			of: [RestaurantsListModel].self,
			completion: { result in
				// Then
				switch result {
				case .failure:
					XCTFail()
				case .success(let model):
					expectation.fulfill()
					XCTAssertFalse(model.isEmpty)
					if let first = try? XCTUnwrap(model.first) {
						XCTAssertEqual(first.name, dataMock[0].name)
						XCTAssertEqual(first.category, dataMock[0].category)
						XCTAssertEqual(first.deliveryTime.min, dataMock[0].deliveryTime.min)
						XCTAssertEqual(first.deliveryTime.max, dataMock[0].deliveryTime.max)
					} else {
						XCTFail()
					}
				}
				
			}
		)

		wait(for: [expectation], timeout: 2)
	}

	func test_get_emptyData_failure() {
		// Given
		let endpoint = Router.fetchRestaurants
		let successCompletion: URLProtocolMock.RequestCompletion = (
			nil,
			nil,
			nil
		)
		let mockSession = URLProtocolMock.mockSession(
			with: endpoint.getRequest,
			completionMock: successCompletion
		)
		self.sut = APIService(mockSession)

		let expectation = expectation(description: "failure")

		// When
		sut.get(
			request: endpoint.getRequest,
			of: [RestaurantsListModel].self,
			completion: { result in
				// Then
				switch result {
				case .failure(let error):
					expectation.fulfill()
					XCTAssertEqual(error.localizedDescription, ServiceError.emptyData.localizedDescription)
				case .success:
					XCTFail()
				}
			}
		)

		wait(for: [expectation], timeout: 2)
	}

	func test_get_error_failure() {
		// Given
		let endpoint = Router.fetchRestaurants
		let expectedError = NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
		let successCompletion: URLProtocolMock.RequestCompletion = (
			nil,
			nil,
			expectedError
		)
		let mockSession = URLProtocolMock.mockSession(
			with: endpoint.getRequest,
			completionMock: successCompletion
		)
		self.sut = APIService(mockSession)

		let expectation = expectation(description: "failure")

		// When
		sut.get(
			request: endpoint.getRequest,
			of: [RestaurantsListModel].self,
			completion: { result in
				// Then
				switch result {
				case .failure(let error):
					expectation.fulfill()
					XCTAssertEqual(error.localizedDescription, ServiceError.requestFailed(description: expectedError.localizedDescription).localizedDescription)
				case .success:
					XCTFail()
				}
			}
		)

		wait(for: [expectation], timeout: 2)
	}

	func test_get_decodeError_failure() {
		// Given
		let endpoint = Router.fetchRestaurants
		let successCompletion: URLProtocolMock.RequestCompletion = (
			"{\"key\": \"value\"}".data(using: .utf8),
			nil,
			nil
		)
		let mockSession = URLProtocolMock.mockSession(
			with: endpoint.getRequest,
			completionMock: successCompletion
		)
		self.sut = APIService(mockSession)

		let expectation = expectation(description: "failure")

		// When
		sut.get(
			request: endpoint.getRequest,
			of: [RestaurantsListModel].self,
			completion: { result in
				// Then
				switch result {
				case .failure(let error):
					expectation.fulfill()
					XCTAssertEqual(error.localizedDescription, ServiceError.decodeError.localizedDescription)
				case .success:
					XCTFail()
				}
			}
		)

		wait(for: [expectation], timeout: 2)
	}



	// MARK: - Mocks
	private func createResquestCompletionMock<T: Codable>(
		endpoint: Router,
		dataMock: T,
		statusCode: Int,
		error: Error? = nil
	) -> URLProtocolMock.RequestCompletion {
		let data = try? JSONEncoder().encode(dataMock)
		let response = HTTPURLResponse(
			url: endpoint.url,
			statusCode: statusCode,
			httpVersion: nil,
			headerFields: nil
		)
		return (data, response, error)
	}

	private func dataMock() -> [RestaurantsListModel] {
		let dataMock: [RestaurantsListModel] = [
			RestaurantsListModel(
				name: "Benjamin a Padaria",
				category: "Padaria",
				deliveryTime: .init(min: 10, max: 45)
			)
		]
		return dataMock
	}

}
