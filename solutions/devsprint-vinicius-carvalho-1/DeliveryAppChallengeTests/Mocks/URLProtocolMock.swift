//
//  URLProtocolMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Alley Pereira on 25/01/22.
//

import Foundation

class URLProtocolMock: URLProtocol {

	typealias RequestCompletion = (data: Data?, response: HTTPURLResponse?, error: Error?)

    static var emit: ((URLRequest) -> Void)?
    static var requestCompletion: RequestCompletion?

	static func buildSession() -> URLSession {
		let sessionConfiguration = URLSessionConfiguration.ephemeral
		sessionConfiguration.protocolClasses = [URLProtocolMock.self]

		let mockSession = URLSession(configuration: sessionConfiguration)

		return mockSession
	}

    static func simulate(completionMock: RequestCompletion = (nil, nil, nil)) {
        requestCompletion = completionMock
    }

	override class func canInit(with request: URLRequest) -> Bool {
		// Handle all types of requests
		true
	}

	override class func canonicalRequest(for request: URLRequest) -> URLRequest {
		// Required to be implemented here. Just return what is passed
		request
	}

	override func startLoading() {
        // This code line is for capture the request maded and check http status and verbs
        // URLProtocolMock.emit?(request)

		// We have a mock response specified so return it.
        if let responseStrong = URLProtocolMock.requestCompletion?.response {
			self.client?.urlProtocol(self, didReceive: responseStrong, cacheStoragePolicy: .notAllowed)
		}

		// We have mocked data specified so return it.
		if let dataStrong = URLProtocolMock.requestCompletion?.data, dataStrong != "null".data(using: .utf8) {
			self.client?.urlProtocol(self, didLoad: dataStrong)
		}

		// We have a mocked error so return it.
		if let errorStrong = URLProtocolMock.requestCompletion?.error {
			self.client?.urlProtocol(self, didFailWithError: errorStrong)
		}

		// Send the signal that we are done returning our mock response
		self.client?.urlProtocolDidFinishLoading(self)
	}

    // Required to be implemented. Do nothing here.
    override func stopLoading() {}
}
