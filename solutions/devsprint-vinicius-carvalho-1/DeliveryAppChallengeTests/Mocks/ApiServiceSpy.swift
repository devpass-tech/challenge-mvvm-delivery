//
//  ApiServiceSpy.swift
//  DeliveryAppChallengeTests
//
//  Created by Gustavo Soares on 31/01/22.
//

import Foundation
@testable import DeliveryAppChallenge

final class APIServiceSpy: APIServiceProtocol {

    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }

    var getCalled: Bool = false

    func get<T>(
        request: URLRequest,
        of type: T.Type,
        completion: @escaping (Result<T, ServiceError>) -> Void
    ) where T : Decodable {
        getCalled = true

    }
}
