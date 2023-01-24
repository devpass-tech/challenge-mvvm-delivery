//
//  SceneDelegate.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(frame: UIScreen.main.bounds)
    
        let service = DeliveryApi()
        let viewModel = HomeViewModel(service: service)
        let controller = HomeViewController(viewModel: viewModel)
        
        self.window?.rootViewController = UINavigationController(rootViewController: controller)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

