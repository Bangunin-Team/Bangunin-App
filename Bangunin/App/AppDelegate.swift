//
//  AppDelegate.swift
//  Bangunin
//
//  Created by FauziArda on 23/10/23.
//

import UIKit
import presentation
import domain
import data

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        let rootViewController = PostsUIComposer.makePosts()
        
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}


class AppEnvironment {
    static let baseURL = "https://jsonplaceholder.typicode.com/posts"
}
