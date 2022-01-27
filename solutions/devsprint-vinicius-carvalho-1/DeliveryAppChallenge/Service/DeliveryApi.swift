//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

enum ApiResponse: Error {
    case invalidResponse
    case requestFailed
}

struct DeliveryApi {

    func fetchRestaurants(_ completion: ([String]) -> Void) {

        completion(["Restaurant 1", "Restaurant 2", "Restaurant 3"])
    }

    func searchAddresses(_ completion: @escaping (Result<[Address], ApiResponse>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json") else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let address = try? JSONDecoder().decode([Address].self, from: data) {
                    completion(.success(address))
                } else {
                    completion(.failure(.invalidResponse))
                }
            } else {
                completion(.failure(.requestFailed))
            }
        }
        task.resume()
    }

    func fetchRestaurantDetails(_ completion: (String) -> Void) {

        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: (String) -> Void) {

        completion("Menu Item")
    }
}
