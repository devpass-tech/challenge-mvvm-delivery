//
//  DeliveryRequest.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 25/01/23.
//

import Foundation

enum DeliveryRequest: RequestProtocol {
    case restaurants
    case addresses
    case menuItem
    case restaurantDetail
    
    private static var basePath: String {
        return "https://raw.githubusercontent.com/Bruques/challenge-mvvm-delivery/main/api"
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
        let url = URL(string: "\(Self.basePath)\(self.path)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = self.method.rawValue
        return request
    }
}
