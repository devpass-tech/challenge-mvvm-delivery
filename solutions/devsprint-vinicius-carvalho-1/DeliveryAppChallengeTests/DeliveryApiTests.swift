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

		let session: URLSession

		init(session: URLSession) {
			self.session = session
		}

		var getCalled: Bool = false

		func get<T>(
			request: URLRequest,
			of type: T.Type,
			completion: @escaping (Result<T, ServiceError>) -> Void
		) where T : Decodable {
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
		let spy = APIServiceSpy(
			session: URLProtocolMock.mockSession(
				with: Router.fetchRestaurants.getRequest,
				completionMock: (nil,nil,nil)
			)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurants { _ in
			
		// Then
			XCTAssertTrue(spy.getCalled)
		}
	}

	func test_fetchRestaurantList_apiManagerSendsNilForRequestEmpty() {
		// Given
		let spy = APIServiceSpy(
			session: URLProtocolMock.mockSession(
				with: Router.fetchRestaurantDetails.getRequest,
				completionMock: (nil,nil,ServiceError.emptyData)
			)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurants { list in

			// Then
			XCTAssert(list.isEmpty)
		}
	}

	func test_fetchRestaurantList_aapiManagerReturnNonEmptyList() {
		// Given
		let listMock = [RestaurantsListModel(
			name: "Benjamin a Padaria",
			category: "Padaria",
			deliveryTime: .init(min: 10, max: 45)
		)]
		let data: Data = try! JSONEncoder().encode(listMock)
		let spy = APIServiceSpy(
			session:
				URLProtocolMock.mockSession(
					with: Router.fetchRestaurants.getRequest,
					completionMock: (data, nil, nil)
				)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurants { listArray in
			// Then
			listArray.enumerated().forEach { (index, restaurant) in
				XCTAssertEqual(restaurant.category, listMock[index].category)
			}
		}
	}

	func test_fetchRestaurantDetails_apiManagerCallsGet() {
		// Given
		let spy = APIServiceSpy(
			session: URLProtocolMock.mockSession(
				with: Router.fetchRestaurantDetails.getRequest,
				completionMock: (nil,nil,nil)
			)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurantDetails { _ in

		// Then
			XCTAssertTrue(spy.getCalled)

		}
	}

	func test_fetchRestaurantDetails_apiManagerSendsNilForRequestError() {
		// Given
		let spy = APIServiceSpy(
			session: URLProtocolMock.mockSession(
				with: Router.fetchRestaurantDetails.getRequest,
				completionMock: (nil,nil,ServiceError.decodeError)
			)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurantDetails { details in

			// Then
			XCTAssertNil(details)
		}
	}

	func test_fetchRestaurantDetails_apiManagerReturnNonEmptyDetails() {
		// Given
		let detailsMock = RestaurantDetailsModel(
			name: "Benjamin a Padaria",
			category: "Padaria",
			deliveryTime: .init(min: 10, max: 45),
			reviews: .init(score: 4.6, count: 100),
			menu: .init(name: "Bolo de Laranja 🍊", category: "Padaria", price: 9.99)
		)

		let data: Data = try! JSONEncoder().encode(detailsMock)
		let spy = APIServiceSpy(
			session: URLProtocolMock.mockSession(
				with: Router.fetchRestaurantDetails.getRequest,
				completionMock: (data, nil, nil)
			)
		)
		self.sut.serviceManager = spy

		// When
		sut.fetchRestaurantDetails { details in
			// Then
			XCTAssertEqual(details?.name, detailsMock.name)
		}
	}
}
