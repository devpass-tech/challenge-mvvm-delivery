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
    private var stub: DeliveryApiService!

    override func setUp() {
        super.setUp()
        stub = DeliveryApiServiceStub()
        sut = RestaurantDetailsViewModel(with: stub)
    }

    override func tearDown() {
        stub = nil
        sut = nil
        super.tearDown()
    }

    func testLoadRestaurantDetails() throws {


//        sut.loadRestaurantDetails()
//        XCTAssertTrue(presenter.displayedDetails)
    }

    func testLoadRestaurantDetailsWithError() throws {
//        service.errorAPI = .emptyData
//        sut.loadRestaurantDetails()
//        XCTAssertTrue(presenter.displayedErrors)
    }

}
