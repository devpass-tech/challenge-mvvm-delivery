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
    private var stub: DeliveryApiServiceStub!

    // MARK: Test setup
    override func setUp() {
        super.setUp()
        self.stub = DeliveryApiServiceStub()
        self.sut = DeliveryApi(serviceManager: stub)
    }

    override func tearDown() {
        self.stub = nil
        self.sut = nil
        super.tearDown()
    }

    func test_fetchRestaurantList_shouldReturnNil() {
        sut.fetchRestaurants { list in
            XCTAssert(list.isEmpty)
        }
    }

    func test_fetchRestaurantList_apiManagerReturnNonEmptyList() {
        // Given
        let listMock = [RestaurantsListModel(
            name: "Benjamin a Padaria",
            category: "Padaria",
            deliveryTime: .init(min: 10, max: 45)
        )]

        stub.expectedRestaurants = .success(listMock)
        // When
        sut.fetchRestaurants { listArray in
            // Then
            listArray.enumerated().forEach { (index, restaurant) in
                XCTAssertEqual(restaurant.category, listMock[index].category)
            }
        }
    }

    func test_fetchRestaurantDetails_apiManagerSendsNilForRequestError() {
        // Given
        stub.expectedDetails = nil
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
        stub.expectedDetails = detailsMock
        // When
        sut.fetchRestaurantDetails { details in
            // Then
            XCTAssertEqual(details?.name, detailsMock.name)
        }
    }
}
