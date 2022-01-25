//
//  DeliveryApiTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Gustavo Soares on 25/01/22.
//

import Foundation
import XCTest

@testable import DeliveryAppChallenge

final class DeliveryApiTests: XCTestCase {
    // TODO: Create mock spy for Delivery api abstraction
    private var sut: DeliveryApi!

    override func setUp() {
        super.setUp()
        sut = DeliveryApi()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetchRestaurantDetails_shouldReturnValidDetails() {
        let expectation = expectation(description: "waiting api return")

        sut.fetchRestaurantDetails { restaurant in
            XCTAssertNotNil(restaurant)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchRestaurantDetails_shouldReturnNil() {
        XCTFail("Test not implemented yet =P")
    }
}
