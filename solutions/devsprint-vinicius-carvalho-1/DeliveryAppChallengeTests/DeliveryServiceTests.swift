//
//  ServiceManagerTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import XCTest
@testable import DeliveryAppChallenge

final class DeliveryServiceTests: XCTestCase {

    // MARK: Subject under test
    private var spy: NetworkManager!
    private var sut: DeliveryApiService!

    // MARK: Test setup
    override func setUp() {
        super.setUp()
        self.spy = NetworkManagerService(URLProtocolMock.buildSession())
        self.sut = DeliveryServiceImplementation(networkDataSource: spy)
    }

    override func tearDown() {
        self.spy = nil
        self.sut = nil
        super.tearDown()
    }

    func test_fetchRestaurants_shouldReturnRestaurantsList() throws {
        // Given
        let endpoint = Router.fetchRestaurants
        let dataMock = dataMock()
        let successCompletion = createResquestCompletionMock(
            endpoint: endpoint,
            dataMock: dataMock,
            statusCode: 200,
            error: nil
        )

        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "success")
        // When

        sut.fetchRestaurants { result in
            switch result {
            case .failure:
                XCTFail()
            case .success(let restaurantsList):
                if let first = try? XCTUnwrap(restaurantsList.first) {
                    XCTAssertEqual(first.name, dataMock[0].name)
                    XCTAssertEqual(first.category, dataMock[0].category)
                    XCTAssertEqual(first.deliveryTime.minimum, dataMock[0].deliveryTime.minimum)
                    XCTAssertEqual(first.deliveryTime.maximum, dataMock[0].deliveryTime.maximum)
                } else {
                    XCTFail()
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchRestaurants_shouldReturnEmptyRestaurantsList() {
        // Given
        let expectedCompletion: URLProtocolMock.RequestCompletion = (
            nil,
            nil,
            nil
        )

        URLProtocolMock.simulate(completionMock: expectedCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchRestaurants { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.emptyData.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchRestaurants_shouldReturnFailure() {
        // Given
        let expectedError = NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
        let expectedCompletion: URLProtocolMock.RequestCompletion = (
            nil,
            nil,
            expectedError
        )

        URLProtocolMock.simulate(completionMock: expectedCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchRestaurants { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.requestFailed(description: expectedError.localizedDescription).localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchRestaurants_shouldReturnDecodeError() {
        // Given
        let successCompletion: URLProtocolMock.RequestCompletion = (
            "{\"key\": \"value\"}".data(using: .utf8),
            nil,
            nil
        )

        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchRestaurants{ result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.decodeError.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_searchAddress_shouldReturnSuccess() {
        // Given
        let endpoint = Router.fetchAddress
        let addressDataMock = addressDataMock()
        let successCompletion = createResquestCompletionMock(endpoint: endpoint,
                                                             dataMock: addressDataMock,
                                                             statusCode: 200,
                                                             error: nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "Success")

        // When
        sut.searchAddresses { result in
            // Then
            switch result {
            case .failure:
                XCTFail()
            case .success(let address):
                XCTAssertFalse(address.isEmpty)
                if let address = try? XCTUnwrap(address.first) {
                    XCTAssertEqual(address.street, addressDataMock[0].street)
                    XCTAssertEqual(address.number, addressDataMock[0].number)
                    XCTAssertEqual(address.neighborhood, addressDataMock[0].neighborhood)
                } else {
                    XCTFail()
                }
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.7)
    }

    func test_searchAddress_shouldReturnEmptyData() {
        // Given
        let successCompletion: URLProtocolMock.RequestCompletion = (nil,nil,nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.searchAddresses { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.emptyData.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.7)
    }

    func test_searchAddress_shouldReturnFailure() {
        // Given
        let expectedError = NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
        let successCompletion: URLProtocolMock.RequestCompletion = (nil,nil,expectedError)

        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.searchAddresses { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription,
                               ServiceError.requestFailed(description: expectedError.localizedDescription).localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.7)
    }

    func test_searchAddress_shouldReturnDecodeError() {
        // Given
        let successCompletion: URLProtocolMock.RequestCompletion = ("{\"key\": \"value\"}".data(using: .utf8), nil, nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.searchAddresses { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.decodeError.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func test_fetchMenuItems_shouldReturnMenuItemsList() {
        // Given
        let endpoint = Router.fetchMenuItem
        let menuItemsDataMock = restaurantDataMock()
        let successCompletion = createResquestCompletionMock(endpoint: endpoint,
                                                             dataMock: menuItemsDataMock,
                                                             statusCode: 200,
                                                             error: nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "Success")

        // When
        sut.fetchMenuItem { result in
            // Then
            switch result {
            case .failure:
                XCTFail()
            case .success(let items):
                XCTAssertFalse(items.isEmpty)
                guard let firstItem = items.first else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(firstItem.category, menuItemsDataMock.menu[0].category)
                XCTAssertEqual(firstItem.price, menuItemsDataMock.menu[0].price)
                XCTAssertEqual(firstItem.name, menuItemsDataMock.menu[0].name)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchMenuItems_shouldReturnEmptyList() {
        // Given
        let successCompletion: URLProtocolMock.RequestCompletion = (nil,nil,nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchMenuItem { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.emptyData.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_fetchMenuItems_shouldReturnFailure() {
        // Given
        let expectedError = NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil)
        let successCompletion: URLProtocolMock.RequestCompletion = (nil,nil,expectedError)

        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchMenuItem { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription,
                               ServiceError.requestFailed(description: expectedError.localizedDescription).localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.7)
    }

    func test_fetchMenuItems_shouldReturnDecodeError() {
        // Given
        let successCompletion: URLProtocolMock.RequestCompletion = ("{\"key\": \"value\"}".data(using: .utf8), nil, nil)
        URLProtocolMock.simulate(completionMock: successCompletion)
        let expectation = expectation(description: "failure")

        // When
        sut.fetchMenuItem { result in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, ServiceError.decodeError.localizedDescription)
            case .success:
                XCTFail()
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }


    // MARK: - Mocks
    private func createResquestCompletionMock<T: Codable>(
        endpoint: Router,
        dataMock: T,
        statusCode: Int,
        error: Error? = nil
    ) -> URLProtocolMock.RequestCompletion {
        let data = try? JSONEncoder().encode(dataMock)
        let response = HTTPURLResponse(
            url: endpoint.url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
        return (data, response, error)
    }

    private func restaurantDataMock() -> Restaurant {
        Restaurant(name: "Benjamin a Padaria", category: "Padaria", deliveryTime: DeliveryTime(minimum: 10, maximum: 45), reviews: Review(score: 10, count: 10), menu: menuItemsMock())
    }

    private func dataMock() -> [Restaurant] {
        [Restaurant(name: "Benjamin a Padaria", category: "Padaria", deliveryTime: DeliveryTime(minimum: 10, maximum: 45), reviews: Review(score: 10, count: 10), menu: [])]
    }

    private func addressDataMock() -> [Address] {
        [Address(street: "Rua Augusta", number: "495", neighborhood: "Consolação")]
    }

    private func menuItemsMock() -> [RestaurantItem] {
        [RestaurantItem(category: "Dummy", name: "Dummy", price: 10.0)]
    }
}
