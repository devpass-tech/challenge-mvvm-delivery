//
//  ApiManager.swift
//  DeliveryAppChallenge
//
//  Created by Tatiana Rico on 15/02/22.
//

import Foundation

protocol APIManagerProtocol {
    func performRequest<T: Codable>(pathURL: String, method: HTTPMethod, completion: @escaping(Result<T, APIError>) -> Void)
}

enum HTTPMethod: String {
    case get = "GET"
}

enum APIError: Error {
    case invalidURL
    case errorNetwork
    case noData
    case parseError
}

class ApiManager: APIManagerProtocol {
    
    func performRequest<T: Codable>(
        pathURL: String,
        method: HTTPMethod,
        completion: @escaping (Result<T, APIError>) -> Void) {
            
            //        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "ServerURL") as? String,
            //                let url = URL(string: baseURL + pathURL)
            //        else { return completion(.failure(.invalidURL)) }
            
            guard let url = URL(string: pathURL) else { return completion(.failure(.invalidURL))}
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let response = response as? HTTPURLResponse, let data = data else { return }
                
                if let error =  error as? APIError {
                    return completion(.failure(error))
                }
                
                if response.statusCode == 200 {
                    do{
                        let jsonDecoder = JSONDecoder()
                        let repository = try jsonDecoder.decode(T.self, from: data)
                        completion(.success(repository))
                    } catch {
                        completion(.failure(.parseError))
                    }
                    
                } else{
                    completion(.failure(.errorNetwork))
                }
            }
            dataTask.resume()
        }
}
