//
//  APIManager.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 09/11/21.
//

import Foundation

enum HTTPMethod: String {
	 case get = "GET"
}

protocol APIManagerProtocol {
	func performRequest<T: Decodable>(pathURL: String, method: HTTPMethod, completion: @escaping(Result<T, APIError>) -> Void)
}


class APIManager: APIManagerProtocol {
	
	func performRequest<T: Decodable>(
		pathURL: String,
		method: HTTPMethod,
		completion: @escaping (Result<T, APIError>) -> Void
	) {
		
		guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as? String,
				let url = URL(string: baseURL + pathURL)
		else { return completion(.failure(.invalidURL)) }
		
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue
		
		let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error as? APIError {
				return completion(.failure(error))
			}
			
			if let response = response as? HTTPURLResponse, !(200...299 ~= response.statusCode) {
				completion(.failure(.errorNetwork))
				return
			}
			
			guard let data = data else {
				completion(.failure(.noData))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				let result = try decoder.decode(T.self, from: data)
				completion(.success(result))
			} catch {
				completion(.failure(.parseError))
			}
		}
		
		dataTask.resume()
	}
	
}
