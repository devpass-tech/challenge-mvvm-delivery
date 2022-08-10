//
//  DeliveryApiRequest.swift
//  DeliveryAppChallenge
//
//  Created by Matheus dos Reis de Jesus on 02/08/22.
//

import Foundation

enum DeliveryApiRequest {
    case fetchRestaurants
    case fetchRestaurantDetails
    case fetchSearchAdresses
    case fetchMenuItem
    
    static let baseUrl: String = {
        let urlEnv = Bundle.main.object(forInfoDictionaryKey: "DeliveryApiBaseUrl")
        return (urlEnv as? String) ?? ""
    }()
    
    private var url: URL { URL(string: Self.baseUrl+path)! }
    
    var path: String {
        switch self {
        case .fetchRestaurants:
            return "/home_restaurant_list.json"
        case .fetchRestaurantDetails:
            return "/restaurant_details.json"
        case .fetchSearchAdresses:
            return "/address_search_results.json"
        case .fetchMenuItem:
            return "/menu_item_details.json"
        }
    }
    
    var urlRequest: URLRequest {
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        return req
    }
}
