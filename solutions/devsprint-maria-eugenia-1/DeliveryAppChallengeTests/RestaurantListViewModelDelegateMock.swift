//
//  RestaurantListViewModelDelegateMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Tatiana Rico on 24/02/22.
//

import XCTest
@testable import DeliveryAppChallenge


class RestuarantListPresentableMock: RestuarantListPresentable {
    var numberReloadData = 0
    var numberError = 0
    
    func reloadData() {
        numberReloadData += 1
    }
    
    func presentError(title: String, message: APIError) {
        numberError += 1
    }
}

class RestaurantListViewModelDelegateMock: XCTestCase {
    var view: RestaurantListView?
    var viewController: RestaurantListViewController!
    var sut = RestaurantListViewModel()
    
    
    func testNumberCount() {
        let modelTest = RestaurantModel(name: "", category: "", deliveryTime: DeliveryTime(min: 20, max: 40))
        sut.model = [modelTest, modelTest]
        let value = sut.numberOfRow()
        XCTAssertEqual(value, 2)
    }
    
    func test_error() {
        let delegate = RestuarantListPresentableMock()
        sut.delegatePresentable = delegate
        delegate.presentError(title: "error", message: .noData)
        XCTAssertEqual(delegate.numberError, 1)
    }
    
    func testReload() {
        sut.delegatePresentable?.reloadData()
    }
}
