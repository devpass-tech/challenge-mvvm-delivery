//
//  AppDelegate.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		 
		 DataSourceUserDefaults.addValue(with: "John Appleseed", forKey: .name)
		 DataSourceUserDefaults.addValue(with: "john@apple.com", forKey: .email)
		 DataSourceUserDefaults.addValue(with: "Rua Bela Cintra, 495 - Consolação", forKey: .address)
		 DataSourceUserDefaults.addValue(with: "Cartão de Crédito", forKey: .payment)
		 
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

