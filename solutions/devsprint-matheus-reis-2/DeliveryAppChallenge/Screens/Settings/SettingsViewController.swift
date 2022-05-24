//
//  SettingsViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 31/10/21.
//

import UIKit

protocol SettingsViewControllerProtocol: AnyObject {
    func getName() -> String
    func getEmail() -> String
    func getAddress() -> String
    func getPaymentMethod() -> String
    
}


class SettingsViewController: UIViewController, SettingsViewControllerProtocol {

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
        self.view = SettingsView(delegate: self)
    }
    
    func getName() -> String {
        return viewModel.getInfo(for: .userName)
    }
    
    func getEmail() -> String {
        return viewModel.getInfo(for: .userEmail)
    }
    
    func getAddress() -> String {
        return viewModel.getInfo(for: .userAddress)
    }
    
    func getPaymentMethod() -> String {
        return viewModel.getInfo(for: .paymentMethod)
    }

}
