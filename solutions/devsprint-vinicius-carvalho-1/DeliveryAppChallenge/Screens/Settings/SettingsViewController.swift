//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

class SettingsViewController: UIViewController {

    var viewModel: SettingsViewModel = SettingsViewModel()

    init() {
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Settings"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationController?.pushViewController(AddressSearchViewController(), animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.coordinator?.onFinish()
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
}
