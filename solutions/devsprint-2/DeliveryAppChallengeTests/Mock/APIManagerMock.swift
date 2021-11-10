//
//  APIManagerMock.swift
//  DeliveryAppChallengeTests
//
//  Created by Alexandre Cardoso on 09/11/21.
//

import Foundation
@testable import DeliveryAppChallenge

class APIManagerMock: APIManagerProtocol {
	
	var errorAPI: APIError? = nil
	
	func performRequest<T: Decodable>(
		pathURL: String,
		method: HTTPMethod,
		completion: @escaping (Result<T, APIError>) -> Void
	) {
		
		switch errorAPI {
			case .invalidURL:
				completion(.failure(.invalidURL))
			case .parseError:
				completion(.failure(.parseError))
			case .noData:
				completion(.failure(.noData))
			case .errorNetwork:
				completion(.failure(.errorNetwork))
			default:
				if let jsonResult = parseJSONMock(), let result = jsonResult as? T {
					completion(.success(result))
				} else {
					completion(.failure(.parseError))
				}
		}
	}
	
	private func parseJSONMock() -> RestaurantDetails? {
		
		guard let path = Bundle.main.path(forResource: "restaurant_details", ofType: "json")
		else { return nil }

		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
			let result = try JSONDecoder().decode(RestaurantDetails.self, from: data)
			return result
		} catch  {
			return nil
		}
		
	}
	
}
