//
//  AppDelegate.swift
//  Bangunin
//
//  Created by FauziArda on 23/10/23.
//

import UIKit
import presentation
import domain

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        let postInteractor = PostInteractor(postDomainRepo: DummyRepo())
        let postVM = PostVM(postInteractor: postInteractor)
        let rootViewController = PostViewController(postVM: postVM)
        
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
    
    private class DummyRepo: PostDomainRepoInterface {
        func getPosts(handler: @escaping ([domain.PostEntity]) -> Void) {
            handler([])
        }
    }
}

