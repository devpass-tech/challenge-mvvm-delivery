//
//  RestaurantDetailsViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 13/11/21.
//

import XCTest
@testable import DeliveryAppChallenge

class RestaurantDetailsViewModelTests: XCTestCase {
    
    var sut: RestaurantDetailsViewModel!
    let presenter = MockRestaurantDetailsPresentable()
    let service = APIManagerMock()
        
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
        service.errorAPI = .noData
        sut.loadRestaurantDetails()
        XCTAssertTrue(presenter.displayedErros)
    }
}
