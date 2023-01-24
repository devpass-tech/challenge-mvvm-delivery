//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

// POP: Protocol Oriented Programming
// DI: Dependency Inversion

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void)
    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetails) -> Void)
    func fetchMenuItem(_ completion: @escaping (MenuItem) -> Void)
    func searchAddresses(_ completion: @escaping ([Address]) -> Void)
}

struct DeliveryApi: DeliveryApiProtocol {
    
    private let network: NetworkManager<DeliveryRequest>
    
    init(network: NetworkManager<DeliveryRequest>) {
        self.network = network
    }

    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api/home_restaurant_list.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                
                return
            }
            
            if response == nil {
                print("No response")
                return
            }
            
            guard let data = data else {
                print("No data present on response")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let result = try? decoder.decode([Restaurant].self, from: data) else {
                print("Decoding error")
                return
            }
            
            completion(result)
        }.resume()
    }

    func searchAddresses(_ completion: @escaping ([Address]) -> Void) {
        network.get(.addresses) { (result: Result<[Address], NetworkError>) in
            switch result {
            case .success(let addresses):
                completion(addresses)
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetails) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-mvvm-delivery/main/api/restaurant_details.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                
                return
            }
            
            if response == nil {
                print("No response")
                return
            }
            
            guard let data = data else {
                print("No data present on response")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let result = try? decoder.decode(RestaurantDetails.self, from: data) else {
                print("Decoding error")
                return
            }
            
            completion(result)
        }.resume()
    }

    func fetchMenuItem(_ completion: @escaping (MenuItem) -> Void) {

        completion(MenuItem(name: "", price: 0, category: "", description: ""))
    }
}
