//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView: HomeView = {
        let view = HomeView()
        view.restaurantListView.tableView.dataSource = self
        view.restaurantListView.tableView.delegate = self
        return view
    }()
    
    private let viewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App 🍕"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.fetch {
            DispatchQueue.main.async {
                self.homeView.restaurantListView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellView.identifier, for: indexPath) as! RestaurantCellView
        
        let restaurant = viewModel.restaurants[indexPath.row]
        
        cell.setup(with: restaurant)

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RestaurantListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = viewModel.restaurants[indexPath.row]

        viewModel.didTapRestaurant(restaurant: restaurant)
    }
}
