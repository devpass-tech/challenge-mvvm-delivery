//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    private let detailsView: RestaurantDetailsView = RestaurantDetailsView()
    
    var viewModel: RestaurantDetailsViewModel
    
    init(viewModel: RestaurantDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getRestaurantDetails {
            DispatchQueue.main.async {
                self.detailsView.menuListView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        self.view = detailsView
        detailsView.menuListView.dataSource = viewModel
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.coordinator?.onFinish()
    }
}
