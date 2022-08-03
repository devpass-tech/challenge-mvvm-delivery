//
//  ServiceError.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 01/08/22.
//

import Foundation

enum ServiceError: Error {
    case requestFailure(_ description: String)
    case emptyData
    case decodingError
    
    var localizedDescription: String {
        switch self {
        case .requestFailure(let description):
            return "The request has failed: \(description)"
        case .emptyData:
            return "The request has returned empty data"
        case .decodingError:
            return "The request data couldn't be decoded"
        }
    }
}
