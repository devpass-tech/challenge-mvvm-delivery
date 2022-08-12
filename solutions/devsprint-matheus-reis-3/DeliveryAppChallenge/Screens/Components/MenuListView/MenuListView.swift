//
//  MenuListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

protocol RestaurantDetailsViewDataSource: AnyObject {
    func getRestaurantMenuList() -> [RestaurantMenuItem]
}

class MenuListView: UIView {

    static let cellSize = CGFloat(96)

    private let cellIdentifier = "MenuCellIdentifier"

    weak var dataSource: RestaurantDetailsViewDataSource?
    
    lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuCellView.self, forCellReuseIdentifier: self.cellIdentifier)
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

extension MenuListView {

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

extension MenuListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.getRestaurantMenuList().count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuCellView
        
        guard let menuItens = dataSource?.getRestaurantMenuList() else { return cell }

        cell.itemNameLabel.text = menuItens[0].name
        cell.itemPriceLabel.text = String(format: "%.2f", menuItens[0].price)

        return cell
    }
}

extension MenuListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
