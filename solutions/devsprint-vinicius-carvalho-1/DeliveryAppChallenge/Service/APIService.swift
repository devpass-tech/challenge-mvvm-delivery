//
//  APIService.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 24/01/22.
//

import Foundation

// MARK: Protocol
protocol APIServiceProtocol {

	var session: URLSession { get }

	func get<T:Decodable>(
		request: URLRequest,
		of type: T.Type,
		completion: @escaping(Result<T, ServiceError>) -> Void
	)
}

// MARK: Implementation
final class APIService: APIServiceProtocol {

	let session: URLSession

	init(_ session: URLSession = .shared) {
		self.session = session
	}

	func get<T: Decodable>(
		request: URLRequest,
		of type: T.Type,
		completion: @escaping (Result<T, ServiceError>) -> Void
	) {
		session.dataTask(with: request) { data, response, error in
			do {
				if let error = error {
					completion(.failure(.requestFailed(description: error.localizedDescription)))
					return
				}

				guard let data = data, !data.isEmpty else {
					completion(.failure(.emptyData))
					return
				}

				let json = try JSONDecoder().decode(T.self, from: data)
				completion(.success(json))

			} catch {
				print("❌ Decode error", error)
				completion(.failure(.decodeError))
			}
		}.resume()
	}
}
