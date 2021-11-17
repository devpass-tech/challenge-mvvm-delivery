//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Pedro Henrique on 17/11/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    let scene: UIScene

    init(window: UIWindow, scene: UIScene) {
        self.window = window
        navigationController = .init()
        
       
        self.scene = scene

//        navigationController.navigationBar.backgroundColor = .systemBlue
//        navigationController.navigationBar.tintColor = .white
    }
    
    func start() {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = HomeViewController()
        navigationController.pushViewController(vc, animated: false)
        window.windowScene = windowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
