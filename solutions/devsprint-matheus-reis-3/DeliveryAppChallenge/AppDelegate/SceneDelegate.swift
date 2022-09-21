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
        
        let viewModel = RestaurantListViewModel(service: DeliveryApi())
        let viewController = RestaurantListViewController(viewModel: viewModel)
        
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

