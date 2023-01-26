//
//  NetworkError.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 25/01/23.
//

import Foundation

enum NetworkError: Error {
    case requestFailure(Error)
    case emptyData
    case emptyResponse
    case decodeFailure
}
