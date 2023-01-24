//
//  DeliveryRequest.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 23/01/23.
//

import Foundation

enum DeliveryRequest: Request {
    case restaurants
    case addresses
    case menuItem
    case restaurantDetail
    
    private static var baseURL: String {
       return "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api"
    }
    
    var path: String {
        switch self {
        case .restaurants:
            return "/home_restaurant_list.json"
        case .addresses:
            return "/address_search_results.json"
        case .menuItem:
            return "/menu_item_details.json"
        case .restaurantDetail:
            return "/restaurant_details.json"
        }
    }
    
    var method: HttpMethod {
        return .GET
    }
    
    var urlRequest: URLRequest {
        let url = URL(string: "\(Self.baseURL)\(self.path)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        
        return request
    }
}
