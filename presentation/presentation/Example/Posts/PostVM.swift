//
//  PostVM.swift
//  presentation
//
//  Created by FauziArda on 23/10/23.
//

import Foundation
import domain

public class PostVM {
    var posts: [PostEntity] = []
    
    private var postInteractor: PostInteractorInterface
    
    init( postInteractor: PostInteractorInterface) {
        self.postInteractor = postInteractor
    }
    
    func getPost(handler: @escaping ([PostEntity])-> Void) {
        postInteractor.getPosts { postDataModelFromDomain in
            self.posts = postDataModelFromDomain
            handler(postDataModelFromDomain)
        }
    }
}
