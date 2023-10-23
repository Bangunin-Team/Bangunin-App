//
//  AppDelegate.swift
//  Bangunin
//
//  Created by FauziArda on 23/10/23.
//

import UIKit
import presentation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        window?.rootViewController = UINavigationController(rootViewController: PostViewController())
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}

