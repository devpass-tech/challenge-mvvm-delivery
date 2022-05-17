//
//  DeliveryApiError.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 17/05/22.
//

import Foundation

enum DeliveryApiError: Error {
    case invalidURL
    case requestError(description: String)
    case invalidResponse
    case invalidData
    case decodingError(description: String)
}
