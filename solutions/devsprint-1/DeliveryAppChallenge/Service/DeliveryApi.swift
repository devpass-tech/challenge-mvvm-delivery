//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

// MARK: - DeliveryApiError

enum DeliveryApiError: Error {
    case invalidURL
    case decodificationError
    case serverError
    case networkError(Int)
    case responseError
}

// MARK: - DeliveryApiProtocol

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void)
}

// MARK: - DeliveryApi

struct DeliveryApi {
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        completion("Restaurant Details")
    }

    func fetchMenuItem(_ completion: (String) -> Void) {
        completion("Menu Item")
    }
}

// MARK: - DeliveryApi

extension DeliveryApi: DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json") else {
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

            guard (200...299).contains(response.statusCode) else {
                return completion(.failure(.networkError(response.statusCode)))
            }

            guard let data = data else {
                return completion(.failure(.decodificationError))
            }

            guard let restaurants: [Restaurant] = data.jSONDecode(using: .convertFromSnakeCase) else {
                return completion(.failure(.decodificationError))
            }

            DispatchQueue.main.async {
                completion(.success(restaurants))
            }
        }
        task.resume()
    }
    
    func searchAddresses(_ completion: @escaping (Result<[Address], DeliveryApiError>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/address_search_results.json") else {
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

            guard (200...299).contains(response.statusCode) else {
                return completion(.failure(.networkError(response.statusCode)))
            }

            guard let data = data else {
                return completion(.failure(.decodificationError))
            }

            guard let addresses: [Address] = data.jSONDecode(using: .convertFromSnakeCase) else {
                return completion(.failure(.decodificationError))
            }

            DispatchQueue.main.async {
                completion(.success(addresses))
            }
        }
        task.resume()
    }
    
}
