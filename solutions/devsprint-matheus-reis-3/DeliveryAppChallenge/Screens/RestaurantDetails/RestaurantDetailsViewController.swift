//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    private lazy var componentView: RestaurantDetailsView = {
        let view = RestaurantDetailsView()
        return view
    }()
    
    private let restaurantDetailsViewModel: RestaurantDetailsViewModel
    
    init(restaurantDetailsViewModel: RestaurantDetailsViewModel) {
        self.restaurantDetailsViewModel = restaurantDetailsViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = componentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantDetailsViewModel.fetchRestaurantDetails { restaurantDetails in
            DispatchQueue.main.async {
                let restaurantInfo = "\(restaurantDetails.category) • \(restaurantDetails.deliveryTime.min)-\(restaurantDetails.deliveryTime.max)"
                
                let restaurantScoreView = "\(String(format: "%.1f", restaurantDetails.reviews.score)) ★★★★★"
                
                let restaurantRatingView = "\(restaurantDetails.reviews.count) avaliações"
                
                self.componentView.restaurantInfoView.updateView(name: restaurantDetails.name, content: restaurantInfo)
                
                self.componentView.ratingView.updateView(score: restaurantScoreView, rating: restaurantRatingView)
                
                self.componentView.menuListView.tableView.reloadData()
            }
        }
    }
}
