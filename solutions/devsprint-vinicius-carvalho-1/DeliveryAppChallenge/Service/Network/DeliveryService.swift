//
//  DeliveryService.swift
//  DeliveryAppChallenge
//
//  Created by Gustavo Soares on 31/01/22.
//

import Foundation

final class DeliveryServiceImplementation: DeliveryApiService {
    
    private let networkDataSource: NetworkManager
    
    init(networkDataSource: NetworkManager = NetworkManagerService()) {
        self.networkDataSource = networkDataSource
    }
    
    func fetchRestaurants(_ completion: @escaping (Result<[Restaurant], ServiceError>) -> Void) {
        networkDataSource.get(request: Router.fetchRestaurants.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode([Restaurant].self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchAddresses(_ completion: @escaping (Result<[Address], ServiceError>) -> Void) {
        networkDataSource.get(request: Router.fetchAddress.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode([Address].self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchRestaurantDetails(_ completion: @escaping (Result<Restaurant, ServiceError>) -> Void) {
        networkDataSource.get(request: Router.fetchRestaurantDetails.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(Restaurant.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchMenuItem(_ completion: @escaping(Result<[RestaurantItem], ServiceError>) -> Void) {
        networkDataSource.get(request: Router.fetchMenuItem.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(Restaurant.self, from: data)
                    completion(.success(json.menu))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
