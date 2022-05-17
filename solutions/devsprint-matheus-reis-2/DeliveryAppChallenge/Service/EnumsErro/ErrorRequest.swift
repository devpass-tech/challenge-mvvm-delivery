//
//  ErrorRequest.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 16/05/22.
//

import Foundation

public enum ErrorRequest: Error {
    case urlNotValid
    case noResponse
    case noData
    case invalidJson
}
