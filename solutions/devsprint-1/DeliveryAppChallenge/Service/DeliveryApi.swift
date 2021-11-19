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

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum UrlPath: String {
    case homeRestaurantList = "home_restaurant_list"
    case restaurantDetails = "restaurant_details"
    case addressSearchResults = "address_search_results"
}

// MARK: - DeliveryApiProtocol

protocol DeliveryApiProtocol {
    func fetchRequest<T: Codable>(urlString: UrlPath, method: HTTPMethod, completion: @escaping ((Result<T, DeliveryApiError>) -> Void))
}

// MARK: - DeliveryApi

struct DeliveryApi {
    func fetchMenuItem(_ completion: (String) -> Void) {
        completion("Menu Item")
    }
}

// MARK: - DeliveryApiProtocol

extension DeliveryApi: DeliveryApiProtocol {
    private func createURL(path: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/devpass-tech/challenge-delivery-app/main/api/\(path).json"
        return urlComponents
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

            guard (200 ... 299).contains(response.statusCode) else {
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

    func fetchRequest<T: Codable>(urlString: UrlPath, method: HTTPMethod = .get, completion: @escaping ((Result<T, DeliveryApiError>) -> Void)) {
        let urlString = urlString.rawValue
        let urlComponents = createURL(path: urlString)

        guard let url = urlComponents.url else {
            return completion(.failure(.invalidURL))
        }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue

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
                return completion(.failure(.decodificationError))
            }

            guard let result: T = data.jSONDecode(using: .convertFromSnakeCase) else {
                return completion(.failure(.decodificationError))
            }

            DispatchQueue.main.async {
                completion(.success(result))
            }
        }
        task.resume()
    }
}
