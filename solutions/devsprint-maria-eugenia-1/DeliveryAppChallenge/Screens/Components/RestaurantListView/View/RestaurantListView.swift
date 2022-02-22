//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol RestaurantListViewDelegate {
    func pushViewController()
}

class RestaurantListView: UIView {
    static let cellSize = CGFloat(82)

    private let cellIdentifier = "RestaurantCellIdentifier"
    private var viewModel: RestaurantListViewModel = RestaurantListViewModel()
    var delegate: RestaurantListViewDelegate?
    
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
        viewModel.delegatePresentable = self
        viewModel.load()
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

        return viewModel.numberOfRow()
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestaurantCellView else { return UITableViewCell() }
        
        cell.setupCell(model: viewModel.cellForRow(indexPath: indexPath))
        cell.selectionStyle = .none
        
        return cell
    }
}

extension RestaurantListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RestaurantListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.pushViewController()
    }
}

extension RestaurantListView: RestuarantListPresentable {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentError(title: String, message: APIError) {
    }
}
