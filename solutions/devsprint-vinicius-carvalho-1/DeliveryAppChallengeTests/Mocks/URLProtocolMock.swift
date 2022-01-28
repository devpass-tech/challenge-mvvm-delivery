//
//  URLProtocolMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import Foundation

class URLProtocolMock: URLProtocol {

	typealias RequestCompletion = (data: Data?, response: HTTPURLResponse?, error: Error?)

	/// Dictionary maps URLs to tuples of error, data, and response
	static var urlRequests = [URLRequest: RequestCompletion]()

	static func mockSession(with request: URLRequest, completionMock: RequestCompletion) -> URLSession {

		urlRequests = [
			request: completionMock
		]

		let sessionConfiguration = URLSessionConfiguration.ephemeral
		sessionConfiguration.protocolClasses = [URLProtocolMock.self]

		let mockSession = URLSession(configuration: sessionConfiguration)

		return mockSession
	}

	override class func canInit(with request: URLRequest) -> Bool {
		// Handle all types of requests
		return true
	}

	override class func canonicalRequest(for request: URLRequest) -> URLRequest {
		// Required to be implemented here. Just return what is passed
		return request
	}

	override func startLoading() {

		let completion = URLProtocolMock.urlRequests[request]

		// We have a mock response specified so return it.
		if let responseStrong = completion?.response {
			self.client?.urlProtocol(self, didReceive: responseStrong, cacheStoragePolicy: .notAllowed)
		}

		// We have mocked data specified so return it.
		if let dataStrong = completion?.data, dataStrong != "null".data(using: .utf8) {
			self.client?.urlProtocol(self, didLoad: dataStrong)
		}

		// We have a mocked error so return it.
		if let errorStrong = completion?.error {
			self.client?.urlProtocol(self, didFailWithError: errorStrong)
		}

		// Send the signal that we are done returning our mock response
		self.client?.urlProtocolDidFinishLoading(self)
	}

	override func stopLoading() {
		// Required to be implemented. Do nothing here.
	}
}
