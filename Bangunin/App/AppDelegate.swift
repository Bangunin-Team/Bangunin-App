//
//  AppDelegate.swift
//  Bangunin
//
//  Created by FauziArda on 23/10/23.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        let rootViewController = MainTabBarUIComposer.makeTabBar()
        
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey(AppEnvironment.gmapsAPIKey)
        return true
    }
}


struct AppEnvironment {
    static let baseURL = "https://jsonplaceholder.typicode.com/posts"
    static let gmapsAPIKey = "AIzaSyB4OROZaoseUp93gHBZTiwtGTUK2e6S-9g"
}
