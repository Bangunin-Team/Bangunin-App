//
//  PostsUIComposer.swift
//  Bangunin
//
//  Created by FauziArda on 29/10/23.
//

import Foundation
import data
import presentation
import domain
import UIKit

struct PostsUIComposer {
    static func makePosts() -> UIViewController {
        let remoteDS = PostRemoteDataSource(urlString: AppEnvironment.baseURL)
        let postRepo = PostDataRepo(remote: remoteDS)
        let postInteractor = PostInteractor(postDomainRepo: postRepo)
        let postVM = PostVM(postInteractor: postInteractor)
        let controller = PostViewController(postVM: postVM)
        
        controller.routeToDetail = { [weak controller] passingClosure in
            let destination = PostsUIComposer.makeDetail(passData: passingClosure)
            controller?.navigationController?.pushViewController(destination, animated: true)
        }
        
        return controller
    }
    
    static func makeDetail( passData: @escaping() -> Int) -> UIViewController {
        let remoteDS = PostRemoteDataSource(urlString: AppEnvironment.baseURL)
        let postRepo = PostDataRepo(remote: remoteDS)
        let postInteractor = PostInteractor(postDomainRepo: postRepo)
        let postDetailVM = PostDetailVM(postInteractor: postInteractor)
        let controller =  PostDetailViewController(postDetailVM: postDetailVM)
        
        controller.passDataRoute = passData
        
        return controller
    }
}
