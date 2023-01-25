//
//  RequestProtocol.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 25/01/23.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var method: HttpMethod { get }
    var urlRequest: URLRequest { get }
}

enum HttpMethod: String {
    case GET
    case POST
    case PATCH
    case DELETE
    case UPDATE
}
