//
//  Router.swift
//  DeliveryAppChallenge
//
//  Created by Alley Pereira on 25/01/22.
//

import Foundation

enum Router {

	/// Create new cases for more requests
	case fetchRestaurants
	case fetchRestaurantDetails
	case fetchMenuItem
    case fetchAddress

	static private let baseURL: String = "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api"

	var url: URL {
		URL(string: Self.baseURL+self.path)!
	}

	var path: String {
		switch self {
		case .fetchRestaurants:
			return "/home_restaurant_list.json"
		case .fetchRestaurantDetails:
			return ""
		case .fetchMenuItem:
			return ""
        case .fetchAddress:
            return "/address_search_results.json"
		}
	}

	var getRequest: URLRequest {
		var request = URLRequest(url: self.url)
		request.httpMethod = "GET"
		return request
	}

}
