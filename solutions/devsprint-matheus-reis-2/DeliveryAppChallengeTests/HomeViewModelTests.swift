//
//  HomeViewModelTests.swift
//  DeliveryAppChallengeTests
//
//  Created by pedro tres on 23/05/22.
//

import XCTest
@testable import DeliveryAppChallenge

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    let service = DeliveryApiMock()
    

    override func setUp()  {
        sut = HomeViewModel(service: service)
        super.setUp()
    }

    override func tearDown()  {
        sut = nil
        super.tearDown()
    }
    
    func test_fetchRestaurants_withData_shouldCallWithSuccess() {
        sut.getRestaurantList{ 
            XCTAssertFalse(self.sut.restaurants.isEmpty)
        }
        
    }
    
    func test_fetchRestaurants_invalidData_shouldCallWithInvalidData() {
        service.error = .invalidData
        sut.getRestaurantList{
            XCTAssert(self.sut.restaurants.isEmpty)
        }
    }
    
    func test_fetchRestaurants_shouldReturnRestaurantLength () {
        sut.restaurants.append(Restaurant(name: "Giraffas", category: "fast-food", deliveryTime: DeliveryTime(min: 10, max: 25)))
        XCTAssertEqual(sut.getItemCount(), 1)
    }
    
    func test_fetchRestaurants_sholdReturnRestaurant() {
        sut.restaurants.append(Restaurant(name: "Giraffas", category: "fast-food", deliveryTime: DeliveryTime(min: 10, max: 25)))
        sut.restaurants.append(Restaurant(name: "Bobs", category: "fast-food", deliveryTime: DeliveryTime(min: 10, max: 25)))
        XCTAssertEqual(sut.getData(at: 1).name, "Bobs")
    }

}
