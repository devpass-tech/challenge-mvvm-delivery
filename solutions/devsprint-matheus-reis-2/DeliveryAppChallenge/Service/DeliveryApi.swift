//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

enum Endpoints {
    static let restaurantList: String = "home_restaurant_list.json"
    static let menuItemDetails: String = "menu_item_details.json"
    static let searchList = "address_search_results.json"
}

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void)
    func searchAddresses(_ completion: @escaping (Result<[Address], DeliveryApiError>) -> Void)
    func fetchRestaurantDetails(_ completion: (String) -> Void)
    func fetchMenuItem(_ completion: @escaping (Result<MenuItem, DeliveryApiError>) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], DeliveryApiError>) -> Void) {
        self.request(Endpoints.restaurantList, completion: completion   )
    }
    
    func searchAddresses(_ completion: @escaping (Result<[Address], DeliveryApiError>) -> Void) {
        self.request(Endpoints.searchList, completion: completion)
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        
    }
    
    func fetchMenuItem(_ completion: @escaping (Result<MenuItem, DeliveryApiError>) -> Void) {
        self.request(Endpoints.menuItemDetails, completion: completion)
    }
    
    private func request<T: Decodable>(_ name: String, completion: @escaping (Result<T, DeliveryApiError>) -> Void){
        guard let  url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api/\(name)") else {
            return completion(.failure(.invalidURL))
            
        }
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error
            in
            
            if let error = error{
                return completion(.failure(.requestError(description: error.localizedDescription)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                return completion(.failure(.invalidResponse))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch(let error) {
                completion(.failure(.decodingError(description: error.localizedDescription)))
            }
        }
        dataTask.resume()
    }
}
