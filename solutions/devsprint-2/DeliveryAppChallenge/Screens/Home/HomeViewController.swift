//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(presentNewScreen))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        self.view = HomeView()
        
    }
    
    @objc func presentNewScreen() {
        let settingsCoordinator =
            SettingCoordinator(viewController: self)
        settingsCoordinator.start()
    }
}
