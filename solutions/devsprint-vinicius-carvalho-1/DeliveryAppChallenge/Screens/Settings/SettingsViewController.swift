//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

class SettingsViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Settings"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
}
