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

    func test_fetchRestaurantList_shouldReturnList() {
        // Given
        let listMock = makeRestaurantList()
        stub.expectedRestaurants = .success(listMock)
        // When
        sut.fetchRestaurants { listArray in
            // Then
            if listArray.isEmpty {
                XCTFail()
            } else {
                listArray.enumerated().forEach { (index, restaurant) in
                    XCTAssertEqual(restaurant.category, listMock[index].category)
                }
            }
        }
    }

    func test_fetchRestaurantDetails_shouldReturnRestaurantDetail() {
        // Given
        let detailsMock = makeDetailRestaurant()
        stub.expectedDetails = .success(detailsMock)
        // When
        sut.fetchRestaurantDetails { result in
            // Then
            switch result {
            case .success(let details):
                XCTAssertEqual(details.name, detailsMock.name)
            case .failure:
                XCTFail()
            }
        }
    }

    func test_fetchMenuItem_shouldReturnValidMenuItems() {
        let detailMock = makeDetailRestaurant()

        stub.expectedItems = .success(detailMock.menu)

        sut.fetchMenuItem { result in
            switch result {
            case .success(let items):
                XCTAssertEqual(items.count, detailMock.menu.count)
            case .failure:
                XCTFail()
            }
        }
    }

    func test_fetchMenuItem_shouldReturnEmptyMenuItems() {
        let detailMock = makeRestaurantList()[0]

        stub.expectedItems = .success(detailMock.menu)

        sut.fetchMenuItem { result in
            switch result {
            case .success(let items):
                XCTAssertTrue(items.isEmpty)
            case .failure:
                XCTFail()
            }
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

    private func makeDetailRestaurant() -> Restaurant {
       Restaurant(
            name: "Benjamin a Padaria",
            category: "Padaria",
            deliveryTime: DeliveryTime(minimum: 10, maximum: 45),
            reviews:  Review(score: 4.6, count: 100),
            menu: [RestaurantItem(category: "Padaria", name: "Bolo de Laranja 🍊", price: 9.99)]
        )
    }
}



