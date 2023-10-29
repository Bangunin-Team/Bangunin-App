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
        return PostViewController(postVM: postVM)
    }
}
