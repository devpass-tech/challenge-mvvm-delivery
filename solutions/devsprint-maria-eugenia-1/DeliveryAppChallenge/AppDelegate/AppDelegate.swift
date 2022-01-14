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

        let userDefaults = UserDefaults.standard
        userDefaults.setValue("John Appleseed", forKey: "user-name")
        userDefaults.setValue("john@apple.com", forKey: "user-email")
        userDefaults.setValue("Rua Bela Cintra, 495 - Consolação", forKey: "address")
        userDefaults.setValue("Cartão de Crédito", forKey: "payment-method")
        userDefaults.synchronize()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

