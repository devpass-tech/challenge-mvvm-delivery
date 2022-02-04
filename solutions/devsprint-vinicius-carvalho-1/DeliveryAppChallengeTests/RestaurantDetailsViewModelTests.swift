//
//  RestaurantDetailsViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 29/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

final class RestaurantDetailsViewModelTests: XCTestCase {

    private var sut: RestaurantDetailsViewModel!
    private var stub: DeliveryApiServiceStub!
    private var presenterSpy: RestaurantDetailsPresentableMock!

    override func setUp() {
        super.setUp()
        stub = DeliveryApiServiceStub()
        presenterSpy = RestaurantDetailsPresentableMock()
        sut = RestaurantDetailsViewModel(with: stub)
        sut.presenter = presenterSpy
    }

    override func tearDown() {
        stub = nil
        sut = nil
        presenterSpy = nil
        super.tearDown()
    }

    func test_LoadRestaurantDetails_shouldDisplayDetails() throws {
        stub.expectedDetails = .success(makeRestaurantDetailMock())
        sut.loadRestaurantDetails()
        XCTAssertTrue(presenterSpy.displayedDetails)
    }

    func testLoadRestaurantDetailsWithError() throws {
        stub.expectedDetails = .failure(.emptyData)
        sut.loadRestaurantDetails()
        XCTAssertTrue(presenterSpy.displayedErrors)
    }
}
extension RestaurantDetailsViewModelTests {
    private func makeRestaurantDetailMock() -> Restaurant {
        Restaurant(name: "Dummy", category: "Dummy", deliveryTime: DeliveryTime(minimum: 10, maximum: 10), reviews: Review(score: 10, count: 10), menu: [])
    }
}
