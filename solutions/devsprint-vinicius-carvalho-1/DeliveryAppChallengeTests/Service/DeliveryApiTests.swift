//
//  DeliveryApiTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Rodrigo Lemos on 25/01/22.
//

import XCTest

@testable import DeliveryAppChallenge

final class DeliveryApiTests: XCTestCase {

    private var sut: DeliveryApi!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = DeliveryApi()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }

    func test_whenFetchAddress_shouldReturnValidAddress() {
        let expectation = expectation(description: "Waiting address to be returned")
        sut.searchAddresses { result in
            switch result {
            case .success(let address):
                if !address.isEmpty {
                    XCTAssertNotNil(address)
                    expectation.fulfill()
                }
            default: break
            }
        }
        wait(for: [expectation], timeout: 0.7)
    }

}
