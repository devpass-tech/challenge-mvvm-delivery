//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

enum URLString: String {
    case restaurant = "home_restaurant_list"
    case restaurantDetails = "restaurant_details"
    case addressSearchResults = "address_search_results"
}

protocol DeliveryApiProtocol {
    func fetchRequest<T: Codable>(_ urlString: URLString, _ completion: @escaping (Result<T, DeliveryApiError>) -> Void)
}

struct DeliveryApi {
    func fetchMenuItem(_ completion: (String) -> Void) {
        completion("Menu Item")
    }
}

// MARK: - DeliveryApiProtocol

extension DeliveryApi: DeliveryApiProtocol {
    func fetchRequest<T: Codable>(_ urlString: URLString, _ completion: @escaping (Result<T, DeliveryApiError>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/\(urlString.rawValue).json") else {
            return completion(.failure(.invalidURL))
        }
        let request = URLRequest(url: url)

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)

        let task = session.dataTask(with: request) { data, response, error in
            if let _ = error {
                return completion(.failure(.serverError))
            }

            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(.responseError))
            }

            guard (200 ... 299).contains(response.statusCode) else {
                return completion(.failure(.networkError(response.statusCode)))
            }

            guard let data = data else {
                return completion(.failure(.dataError))
            }

            let result: Result<T, DeliveryApiError> = data.jSONDecode(using: .convertFromSnakeCase)
            DispatchQueue.main.async {
                switch result {
                    case let .success(data):
                        completion(.success(data))
                    case let .failure(error):
                        completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
