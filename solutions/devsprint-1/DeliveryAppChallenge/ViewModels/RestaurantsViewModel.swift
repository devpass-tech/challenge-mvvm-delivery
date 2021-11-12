//
//  RestaurantsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Dairan on 09/11/21.
//

import Foundation

class RestaurantsViewModel {

    private let repository: DeliveryApi

    init(repository: DeliveryApi = DeliveryApi()) {
        self.repository = repository
        fetchData()
    }

    var bindViewModelUpdated: (() -> Void)?
    var bindViewModeRestaurantDetailslUpdated: (() -> Void)?

    private(set) var restaurants: [Restaurant] = [] {
        didSet { bindViewModelUpdated?() }
    }

    private(set) var restaurantDetails: RestaurantDetails? {
        didSet { bindViewModeRestaurantDetailslUpdated?() }
    }

    var numberOfRows: Int { restaurants.count }

    func itemForCell(at index: IndexPath) -> RestaurantCell {
        let restaurants = restaurants[index.row]
        return RestaurantCell(restaurant: restaurants)
    }

    private func fetchData() {
        repository.fetchRequest(URLString.restaurant) { (result: Result<[Restaurant], DeliveryApiError>) in
            switch result {
                case let .success(restaurants):
                    self.restaurants = restaurants
                case let .failure(error):
                    print(error.message)
            }
        }

        repository.fetchRequest(URLString.restaurantDetails) { (result: Result<RestaurantDetails, DeliveryApiError>) in
            switch result {
                case let .success(restaurantDetails):
                    self.restaurantDetails = restaurantDetails
                case let .failure(error):
                    print(error.message)
            }
        }
    }
}

// MARK: RestaurantCell

struct RestaurantCell {
    let restaurant: Restaurant

    var title: String { restaurant.name }

    var description: String {
        "\(restaurant.category) • \(restaurant.deliveryTime.min)-\(restaurant.deliveryTime.max) min"
    }
}
