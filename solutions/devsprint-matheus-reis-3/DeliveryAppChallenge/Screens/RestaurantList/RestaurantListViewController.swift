//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    private lazy var customView: RestaurantListView = {
        let view = RestaurantListView()
        view.dataSource = viewModel
        return view
    }()
    
    private let viewModel: RestaurantListViewModel
    
    init(viewModel: RestaurantListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Restaurant List"
        viewModel.presenter = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchRestaurants()
    }
}

extension RestaurantListViewController: RestaurantListViewPresentable {
    func reloadList() {
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }
}
