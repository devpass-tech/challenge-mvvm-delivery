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
    // TODO: Create Spy for delivery api abstraction
    private var sut: DeliveryApi!

    override func setUp() {
        super.setUp()
        sut = DeliveryApi()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_fetchMenuItems_shouldReturnValidMenuItems() {
        let expectation = expectation(description: "waiting api return")

        sut.fetchMenuItem { items in
            XCTAssertTrue(items.count > 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchMenuItems_shouldReturnNil() {
        XCTFail("Test not implemented yet =P")
    }
}
