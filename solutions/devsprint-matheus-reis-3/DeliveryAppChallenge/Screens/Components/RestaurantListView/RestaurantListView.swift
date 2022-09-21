//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol RestaurantListViewDataSource: AnyObject {
    func getItem(at: Int) -> Restaurant
    func getItemCount() -> Int
}

class RestaurantListView: UIView {

    static let cellSize = CGFloat(82)

    private let cellIdentifier = "RestaurantCellIdentifier"
    weak var dataSource: RestaurantListViewDataSource?

    lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RestaurantCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        addSubviews()
        configureConstraints()

        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RestaurantListView {

    func addSubviews() {

        addSubview(tableView)
    }

    func configureConstraints() {

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension RestaurantListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.getItemCount() ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantCellView
        
        guard let restaurant = dataSource?.getItem(at: indexPath.row) else {
            return cell
        }
        
        cell.restaurantNameLabel.text = restaurant.name
        cell.restaurantInfoLabel.text = "\(restaurant.category) • \(restaurant.deliveryTime.min)-\(restaurant.deliveryTime.max) min"
        
        return cell
    }
}

extension RestaurantListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RestaurantListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
