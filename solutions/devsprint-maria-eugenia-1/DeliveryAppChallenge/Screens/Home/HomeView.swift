//
//  HomeView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func goToDetailListRestaurant()
}

class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    
    let scrollView: UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let stackView: UIStackView = {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()

    let addressView: AddressView = {

        let addressView = AddressView()
        addressView.translatesAutoresizingMaskIntoConstraints = false
        return addressView
    }()

    let categoryListView: CategoryListView = {

        let categoryListView = CategoryListView()
        categoryListView.translatesAutoresizingMaskIntoConstraints = false
        return categoryListView
    }()

    let restaurantListView: RestaurantListView = {

        let restaurantListView = RestaurantListView()
        restaurantListView.translatesAutoresizingMaskIntoConstraints = false
        return restaurantListView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubviews()
        configureConstraints()
        restaurantListView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView {

    func addSubviews() {

        addSubview(scrollView)
        scrollView.addSubview(stackView)

        stackView.addArrangedSubview(addressView)
        stackView.addArrangedSubview(categoryListView)
        stackView.addArrangedSubview(restaurantListView)
    }

    func configureConstraints() {

        let estimatedHeight = CGFloat(500)

        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            restaurantListView.heightAnchor.constraint(equalToConstant: estimatedHeight)
        ])
    }
}

extension HomeView: RestaurantListViewDelegate {
    func pushViewController() {
        self.delegate?.goToDetailListRestaurant()
    }
}

