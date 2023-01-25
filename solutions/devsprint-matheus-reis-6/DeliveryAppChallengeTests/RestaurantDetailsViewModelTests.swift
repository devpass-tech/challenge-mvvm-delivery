//
//  RestaurantDetailsViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Matheus dos Reis de Jesus on 24/01/23.
//

import Foundation
import XCTest
@testable import DeliveryAppChallenge

class RestaurantDetailsViewModelTests: XCTestCase {
    
    private let serviceMock = DeliveryApiMock()
    
    // SUT: System under test
    private func makeSut() -> RestaurantDetailsViewModelProtocol {
        return RestaurantDetailsViewModel(service: serviceMock)
    }
    
    func testFetchShouldSucceed() {
        // GIVEN: Dado que
        let sut = makeSut()
        let expectation = expectation(description: "Fetch restaurant details succeed")
        
        // WHEN: Quando
        sut.fetch { error in
            if error == nil {
                expectation.fulfill()
            }
        }
        
        // THEN: Então
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchShouldFail() {
        // GIVEN: Dado que
        let sut = makeSut()
        let expectation = expectation(description: "Fetch restaurant details fail")
        
        serviceMock.networkError = .emptyData
        
        // WHEN: Quando
        sut.fetch { error in
            if error != nil {
                expectation.fulfill()
            }
        }
        
        // THEN: Então
        wait(for: [expectation], timeout: 10.0)
    }
    
    override func tearDown() {
        serviceMock.networkError = nil
    }
}
