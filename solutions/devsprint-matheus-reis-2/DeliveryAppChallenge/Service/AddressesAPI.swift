//
//  AddressesAPI.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Vieira Souza on 16/05/22.
//

import Foundation

protocol SearchAddressesProtocol: AnyObject {
    func searchAddresses(completion: @escaping (Result<[Addresses], ErrorRequest>) -> (Void))
}

class AddressesAPI: SearchAddressesProtocol {
    
    let baseURL = "https://raw.githubusercontent.com"
    let pathURL = "/devpass-tech/challenge-delivery-app/main/api/"
    
    func searchAddresses(completion: @escaping (Result<[Addresses], ErrorRequest>) -> (Void)) {
        
        guard let url = URL(string: baseURL + pathURL + "address_search_results.json") else {
            completion(.failure(.urlNotValid))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let addresses = try decoder.decode([Addresses].self, from: data)
                completion(.success(addresses))
            } catch {
                completion(.failure(.invalidJson))
            }
        } .resume()
    }
}
