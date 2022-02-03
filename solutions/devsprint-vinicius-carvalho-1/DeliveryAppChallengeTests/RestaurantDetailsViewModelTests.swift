//
//  RestaurantDetailsViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 29/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

class RestaurantDetailsViewModelTests: XCTestCase {

    var sut: RestaurantDetailsViewModel!
    let presenter = RestaurantDetailsPresentableMock()
    let service = APIServiceMock()

    override func setUp() {
        sut = RestaurantDetailsViewModel(with: service)
        sut.presenter = presenter
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testLoadRestaurantDetails() throws {
        sut.loadRestaurantDetails()
        XCTAssertTrue(presenter.displayedDetails)
    }

    func testLoadRestaurantDetailsWithError() throws {
        service.errorAPI = .emptyData
        sut.loadRestaurantDetails()
        XCTAssertTrue(presenter.displayedErrors)
    }

}
