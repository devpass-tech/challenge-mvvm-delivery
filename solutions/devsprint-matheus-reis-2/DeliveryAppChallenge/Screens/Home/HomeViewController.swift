//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = "Delivery App 🍕"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(openSettingsModal))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        let homeView = HomeView()
        self.view = homeView
        
        homeView.restaurantListView.dataSource = viewModel
        
        viewModel.getRestaurantList {
            DispatchQueue.main.async {
                homeView.restaurantListView.tableView.reloadData()
            }
        }   
    }
    
    @objc func openSettingsModal() {
        present(UINavigationController(rootViewController: SettingsViewController()), animated: true)
    }
}
