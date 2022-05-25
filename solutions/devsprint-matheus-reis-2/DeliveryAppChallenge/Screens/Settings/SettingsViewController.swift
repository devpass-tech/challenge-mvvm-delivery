//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func getInfo(key: SettingsViewModel.UserInfoData) -> String
}

class SettingsViewController: UIViewController, SettingsViewControllerDelegate {
    
    private let viewModel: SettingsViewModel
    
    private let settingsView: SettingsView
    
    init(viewModel: SettingsViewModel = SettingsViewModel(), settingsView: SettingsView = SettingsView()) {
        self.settingsView = settingsView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        settingsView.delegate = self
        navigationItem.title = "Settings"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = settingsView
    }
    
    func getInfo(key: SettingsViewModel.UserInfoData) -> String {
        return  viewModel.getInfo(for: key)
    }
}
