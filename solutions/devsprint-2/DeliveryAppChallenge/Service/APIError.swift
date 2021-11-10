//
//  APIError.swift
//  DeliveryAppChallenge
//
//  Created by Alexandre Cardoso on 09/11/21.
//

import Foundation

enum APIError: Error {
	case invalidURL
	case errorNetwork
	case noData
	case parseError
}
