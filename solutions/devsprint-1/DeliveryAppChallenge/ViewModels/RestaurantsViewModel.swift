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
        repository.fetchRestaurants { result in
            switch result {
                case let .success(restaurants):
                    self.restaurants = restaurants
                case let .failure(error):
                    print(error)
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
