//
//  RestaurantDetailsViewControllerTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Guilherme Prata Costa on 04/02/22.
//
import SnapshotTesting
import XCTest

@testable import DeliveryAppChallenge

class RestaurantDetailsViewControllerTests: XCTestCase {

    var sut: RestaurantDetailsViewController!

    override func setUp() {
        super.setUp()
        sut = RestaurantDetailsViewController()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        SnapshotTesting.isRecording = false
    }

    private func verifyViewController(_ viewController: UIViewController, named: String) {
        let devices: [String: ViewImageConfig] = [
            "iPhone12ProMax": .iPhone12ProMax,
            "iPhone8": .iPhone8,
            "iPhoneSe": .iPhoneSe
        ]

        let results = devices.map { device in
            verifySnapshot(matching: viewController, as: .image(on: device.value),
                           named: "\(named)-\(device.key)",
                           testName: "RestaurantDetailsViewController"
            )
        }
        results.forEach {
            XCTAssertNil($0)
        }
    }

    func test_RestaurantListViewControllerDefaultState() {
        let viewController = UINavigationController(rootViewController: sut)
        verifyViewController(viewController, named: "Default")
    }
}
