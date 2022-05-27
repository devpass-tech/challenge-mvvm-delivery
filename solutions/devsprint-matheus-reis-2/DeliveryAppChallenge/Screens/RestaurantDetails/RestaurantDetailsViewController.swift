//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    var viewModel: RestaurantDetailsViewModel?
    
    init(viewModel: RestaurantDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let detailsView = RestaurantDetailsView()
        self.view = detailsView
        
        detailsView.menuListView.dataSource = viewModel
        
        viewModel?.getRestaurantDetails {
            DispatchQueue.main.async {
                detailsView.menuListView.tableView.reloadData()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.coordinator?.onFinish()
    }
}
