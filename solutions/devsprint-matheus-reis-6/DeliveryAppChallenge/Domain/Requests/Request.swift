//
//  Request.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 23/01/23.
//

import Foundation

protocol Request {
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
