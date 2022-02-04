//
//  RestaurantListSnapshotTests.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 03/02/22.
//

import XCTest
import SnapshotTesting
@testable import DeliveryAppChallenge

class RestaurantListSnapshotTests: XCTestCase {
	
	var sut: RestaurantListViewController!

	override func setUp() {
		super.setUp()
		sut = RestaurantListViewController()
	}

	override func tearDown() {
		super.tearDown()
		sut = nil
		SnapshotTesting.isRecording = false
	}
	
	private func verifyViewController(_ viewController: UIViewController, named: String) {
		let devices: [String: ViewImageConfig] = [
			"iPhoneXr": .iPhoneXr,
			"iPhone8": .iPhone8, 
			"iPhoneSe": .iPhoneSe
		]
		
		let results = devices.map { device in
			verifySnapshot(matching: viewController, as: .image(on: device.value),
						   named: "\(named)-\(device.key)",
						   testName: "RestaurantListViewController"
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
