//
//  RestaurantsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 09/11/21.
//

import Foundation

class RestaurantsViewModel {

    private let repository: DeliveryApi

    // MARK: Lifecycle

    init(repository: DeliveryApi = DeliveryApi()) {
        self.repository = repository
        fetchData()
    }

    // MARK: Internal

    var bindViewModelUpdated: (() -> Void)?

    private(set) var restaurants: [Restaurant] = [] {
        didSet {
            bindViewModelUpdated?()
        }
    }

    var numberOfRows: Int {
        return restaurants.count
    }

    func itemForCell(at index: IndexPath) -> RestaurantCell {
        let restaurants = restaurants[index.row]
        return RestaurantCell(restaurant: restaurants)
    }

    // MARK: Private

    private func fetchData() {
        repository.fetchRequest(urlString: .homeRestaurantList) { (result: Result<[Restaurant], DeliveryApiError>) in
            switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
            }
        }

        repository.fetchRequest(urlString: .restaurantDetails) { (result: Result<RestaurantDetail, DeliveryApiError>) in
            switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
            }
        }
    }
}

// MARK: - RestaurantCell

struct RestaurantCell {
    let restaurant: Restaurant

    var title: String {
        restaurant.name
    }

    var description: String {
        "\(restaurant.category) • \(restaurant.deliveryTime.min)-\(restaurant.deliveryTime.max) min"
    }
}
