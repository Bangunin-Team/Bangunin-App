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
        
        let remoteDS = PostRemoteDataSource(urlString: AppEnvironment.baseURL)
        let postRepo = PostDataRepo(remote: remoteDS)
        let postInteractor = PostInteractor(postDomainRepo: postRepo)
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


class AppEnvironment {
    static let baseURL = "https://jsonplaceholder.typicode.com/posts"
}
