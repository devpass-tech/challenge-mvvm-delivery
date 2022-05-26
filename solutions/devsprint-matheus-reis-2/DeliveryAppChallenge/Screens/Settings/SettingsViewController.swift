//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel = SettingsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Settings"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let settingsView = SettingsView()
        settingsView.delegate = self
        self.view = settingsView

    }
}

extension SettingsViewController: SettingsViewDelegate {
    func getInfo(key: SettingsViewModel.UserInfoData) -> String {
        return  viewModel.getInfo(for: key)
    }
}
