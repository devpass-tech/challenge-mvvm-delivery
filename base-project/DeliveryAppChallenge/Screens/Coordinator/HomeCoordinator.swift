//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Cátia Souza on 17/11/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let window: UIWindow
    let scene: UIScene
    let navigationController: UINavigationController

    init(window: UIWindow, scene: UIScene) {
        self.window = window
        self.scene = scene
       
        navigationController = .init()
    }
    
    func start() {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: false)
        
        window.rootViewController = navigationController
        window.windowScene = windowScene
        window.makeKeyAndVisible()
    }
}
