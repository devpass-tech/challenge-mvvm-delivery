//
//  AddressSearchTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Amaryllis Baldrez on 03/02/22.
//

import XCTest
@testable import DeliveryAppChallenge

class AddressSearchTests: XCTestCase {
    
    var sut: AddressSearchViewModel!
//    let presenter = Address()
    let service = APIServiceMock()
    
    override func setUp() {
        sut = AddressSearchViewModel(with: service)
//        sut.presenter = presenter
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testAddress() throws {
        sut.loadSearchAddress()
//        XCTAssertTrue(presenter.displayedDetails)
    }
    
    func testAddressSearchWithError() throws {
        service.errorAPI = .emptyData
        sut.loadSearchAddress()
//        XCTAssertTrue(presenter.displayedErrors)
    }
    
}
