//
//  DeliveryApiTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

final class DeliveryApiTests: XCTestCase {

	// MARK: Subject under test
	private var sut: DeliveryApi!

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

	func test_fetchRestaurantList_apiManagerReturnNonEmptyList() {
		// Given
		let listMock = makeRestaurantList()
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

    func test_fetchMenuItem_shouldReturnValidMenuItems() {
        let detailMock = makeDetailRestaurant()
        let data: Data = try! JSONEncoder().encode(detailMock)
        let spy = APIServiceSpy(session: URLProtocolMock.mockSession(
            with: Router.fetchMenuItem.getRequest, completionMock: (data, nil, nil)))

        sut.serviceManager = spy

        sut.fetchMenuItem { items in
            XCTAssertEqual(items.count, detailMock.menu.count)
        }
    }

    func test_fetchMenuItem_shouldReturnEmptyMenuItems() {
        let detailMock = makeRestaurantList()[0]
        let data: Data = try! JSONEncoder().encode(detailMock)
        let spy = APIServiceSpy(session: URLProtocolMock.mockSession(
            with: Router.fetchMenuItem.getRequest, completionMock: (data, nil, nil)))

        sut.serviceManager = spy

        sut.fetchMenuItem { items in
            XCTAssertTrue(items.isEmpty)
        }
    }

    func test_fetchMenuItem_shouldReturnErrorForInvalidJson() {
        let spy = APIServiceSpy(session: URLProtocolMock.mockSession(
            with: Router.fetchMenuItem.getRequest, completionMock: (nil, nil, ServiceError.decodeError)))

        sut.serviceManager = spy

        sut.fetchMenuItem { items in
            XCTAssertNil(items)
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
		let detailsMock = makeDetailRestaurant()
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

extension DeliveryApiTests {
    private func makeRestaurantList() -> [Restaurant] {
        [Restaurant(
            name: "Benjamin a Padaria",
            category: "Padaria",
            deliveryTime: DeliveryTime(minimum: 10, maximum: 45),
            reviews: Review(score: 20.0, count: 20),
            menu: []
        )]
    }

    private func makeDetailRestaurant() -> RestaurantDetailsModel {
       RestaurantDetailsModel(
            name: "Benjamin a Padaria",
            category: "Padaria",
            deliveryTime: DeliveryTime(minimum: 10, maximum: 45),
            reviews:  Review(score: 4.6, count: 100),
            menu: [RestaurantItem(category: "Padaria", name: "Bolo de Laranja 🍊", price: 9.99)]
        )
    }
}



