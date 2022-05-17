//
//  DeliveryApiError.swift
//  DeliveryAppChallenge
//
//  Created by pedro tres on 17/05/22.
//

import Foundation

enum DeliveryApiError: Error {
    case invalidURL
    case errorGeneric(description: String)
    case invalidResponse
    case invalidData
    case errorDecoder
}
