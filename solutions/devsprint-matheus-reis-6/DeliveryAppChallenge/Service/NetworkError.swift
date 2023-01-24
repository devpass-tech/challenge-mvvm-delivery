//
//  NetworkError.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 23/01/23.
//

import Foundation

enum NetworkError: Error {
    case requestFailure(Error)
    case emptyResponse
    case emptyData
    case decodeFailure
}
