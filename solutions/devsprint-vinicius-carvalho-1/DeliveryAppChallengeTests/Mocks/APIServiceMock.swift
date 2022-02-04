//
//  APIServiceMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Murillo R. Araújo on 29/01/22.
//

import Foundation
@testable import DeliveryAppChallenge

class APIServiceMock: APIServiceProtocol {
    let session: URLSession

    var errorAPI: ServiceError? = nil

    init(_ session: URLSession = .shared) {
        self.session = session
    }

    func get<T:Decodable>(
        request: URLRequest,
        of type: T.Type,
        completion: @escaping(Result<T, ServiceError>) -> Void
    ) {

        switch errorAPI {
            case .emptyData:
                completion(.failure(.emptyData))
            case .decodeError:
                completion(.failure(.decodeError))
            default:
            let deliveryTime = DeliveryTime(minimum: 20, maximum: 40)
                    let result = Restaurant(
                        name: "Benjamin A Padaria",
                        category: "Padaria",
                        deliveryTime: deliveryTime,
                        reviews: Review(score: 0, count: 0),
                        menu: []
                    )

            completion(.success(result as! T))
        }
    }

    private func parseJSONMock() -> Restaurant? {

        guard let path = Bundle.main.path(forResource: "restaurant_details", ofType: "json")
        else { return nil }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let result = try JSONDecoder().decode(Restaurant.self, from: data)
            return result
        } catch  {
            return nil
        }

    }
}
