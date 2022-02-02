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

    func fetchRestaurants(_ completion: @escaping (Result<[RestaurantsListModel], ServiceError>) -> Void) {
        networkDataSource.get(request: Router.fetchRestaurants.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode([RestaurantsListModel].self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func searchAddresses(_ completion: ([String]) -> Void) {
        completion(["Address 1", "Address 2", "Address 3"])
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetailsModel?) -> Void) {
        networkDataSource.get(request: Router.fetchRestaurantDetails.getRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(RestaurantDetailsModel.self, from: data)
                    completion(json)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }

    func fetchMenuItem(_ completion: (String) -> Void) {
        completion("Menu Item")
    }
}
