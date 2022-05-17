//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

enum UrlName {
    static let restaurantList: String = "home_restaurant_list.json"
}

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ name: String, _ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void)
    func searchAddresses(_ completion: ([String]) -> Void)
    func fetchRestaurantDetails(_ completion: (String) -> Void)
    func fetchMenuItem(_ completion: (String) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    func fetchRestaurants(_ name: String, _ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void) {
        self.request(name, completion: completion   )
    }
    
    func searchAddresses(_ completion: ([String]) -> Void) {
        
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        
    }
    
    func fetchMenuItem(_ completion: (String) -> Void) {
        
    }
    
    private func request<T: Decodable>(_ name: String, completion: @escaping (Result<T, DeliveryApiError>) -> Void){
        guard let  url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api/\(name)") else { return }
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error
            in
            
            if let error = error{
                return completion(.failure(.errorGeneric(description: error.localizedDescription)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                let jsonDecodable = JSONDecoder()
                jsonDecodable.keyDecodingStrategy = .convertFromSnakeCase
                
                if let result = try? jsonDecodable.decode(T.self, from: data) {
                    completion(.success(result))
                } else {
                    completion(.failure(.errorDecoder))
                }
            }
        }
        dataTask.resume()
    }
}
