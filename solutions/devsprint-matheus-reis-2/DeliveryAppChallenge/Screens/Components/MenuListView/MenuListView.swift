//
//  MenuListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

protocol MenuListViewDataSource {
    func getData(at: Int) -> Menu
    func getItemCount() -> Int
}

class MenuListView: UIView {

    static let cellSize = CGFloat(96)

    private let cellIdentifier = "MenuCellIdentifier"
    public var dataSource: MenuListViewDataSource?

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
        
        guard let datasource = dataSource else  {
            return 0
        }
        return datasource.getItemCount()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuCellView
        
        if let data = dataSource?.getData(at: indexPath.row) {
            cell.itemNameLabel.text = data.name
            cell.itemPriceLabel.text = data.formattedPrice()
        }

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
