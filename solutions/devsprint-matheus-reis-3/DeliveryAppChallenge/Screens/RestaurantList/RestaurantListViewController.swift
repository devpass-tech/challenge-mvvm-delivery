//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantListViewController: UIViewController {

    let service: DeliveryApiProtocol
    
    init(service: DeliveryApiProtocol = DeliveryApi()) {
        self.service = service
        
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Restaurant List"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = RestaurantListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.fetchRestaurants { result in
            switch result {
            case .success(let restaurants):
                print(restaurants)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
