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
    func fetchRestaurants(_ name: String, _ completion: @escaping ([Restaurant]?) -> Void)
    func searchAddresses(_ completion: ([String]) -> Void)
    func fetchRestaurantDetails(_ completion: (String) -> Void)
    func fetchMenuItem(_ completion: (String) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    func fetchRestaurants(_ name: String, _ completion: @escaping ([Restaurant]?) -> Void) {
        self.request(name, completion: completion)
    }
    
    func searchAddresses(_ completion: ([String]) -> Void) {
        
    }
    
    func fetchRestaurantDetails(_ completion: (String) -> Void) {
        
    }
    
    func fetchMenuItem(_ completion: (String) -> Void) {
        
    }
    
    private func request<T: Decodable>(_ name: String, completion: @escaping (T?) -> Void){
        guard let  url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api/\(name)") else { return }
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error
            in
            
            if let _ = error{
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecodable = JSONDecoder()
                jsonDecodable.keyDecodingStrategy = .convertFromSnakeCase
                do{
                    let repo = try jsonDecodable.decode(T.self, from: data)
                    completion(repo)
                }catch{
                    print(error)
                    completion(nil)
                }
            }
        }
        dataTask.resume()
    }
}
