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
    
    public init( postInteractor: PostInteractorInterface) {
        self.postInteractor = postInteractor
    }
    
    func getPost(handler: @escaping ([PostEntity])-> Void) {
        postInteractor.getPosts { [weak self] postDataModelFromDomain in
            guard let self = self else { return }
            
            self.posts = postDataModelFromDomain.count > 0 ? postDataModelFromDomain : populateDummyPosts()
            handler(self.posts)
        }
    }
    
    private func populateDummyPosts(_ count: Int = 20) -> [PostEntity]{
        var posts: [PostEntity] = []
        (1...count).forEach { num in
            posts.append(PostEntity(userID: num, id: num, title: "Title \(num)", body: "Body \(num)"))
        }
        return posts
    }
}
