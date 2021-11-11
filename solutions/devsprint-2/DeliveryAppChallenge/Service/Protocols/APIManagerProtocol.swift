//
//  APIManagerProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 10/11/21.
//

import Foundation

protocol APIManagerProtocol {
	func performRequest<T: Decodable>(pathURL: String, method: HTTPMethod, completion: @escaping(Result<T, APIError>) -> Void)
}
