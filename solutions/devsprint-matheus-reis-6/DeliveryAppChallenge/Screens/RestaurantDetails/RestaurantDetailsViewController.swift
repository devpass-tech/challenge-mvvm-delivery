//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    private lazy var restaurantDetailsView: RestaurantDetailsView = {
        let view = RestaurantDetailsView()
        view.menuListView.tableView.dataSource = self
        view.menuListView.tableView.delegate = self
        return view
    }()
    
    let viewModel: RestaurantDetailsViewModelProtocol
    
    init(viewModel: RestaurantDetailsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = restaurantDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetch { error in
            if error == nil {
                DispatchQueue.main.sync {
                    self.restaurantDetailsView.setup(with: self.viewModel.restaurant)
                }
            }
        }
    }
}

extension RestaurantDetailsViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.restaurant.menu.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCellView.identifier, for: indexPath) as! MenuCellView

        let item = viewModel.restaurant.menu[indexPath.row]
        
        cell.setup(with: item)
        
        return cell
    }
}

extension RestaurantDetailsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
