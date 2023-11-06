//
//  PostInteractor.swift
//  domain
//
//  Created by FauziArda on 23/10/23.
//

import Foundation

public protocol PostInteractorInterface {
    func getPosts(handler: @escaping ([PostEntity]) -> Void)
    func getPostByID(ID: Int, handler: @escaping (PostEntity) -> Void)
}

public class PostInteractor: PostInteractorInterface {
    let postDomainRepo: PostDomainRepoInterface
    
    public init(postDomainRepo: PostDomainRepoInterface) {
        self.postDomainRepo = postDomainRepo
    }
    
    ///getPosts() method doesn’t contain actual business logic, just calling another method for the sake of simplicity. But this is where you apply your business logic. For example you can check if a post contains racist words to ban the post — or feature it if you are racist. Or you can check if you have added any of these posts to your favorites and apply a star to it.
    public func getPosts(handler: @escaping ([PostEntity]) -> Void) {
        postDomainRepo.getPosts { postDomainModelArray in
            handler(postDomainModelArray)
        }
    }
    
    public func getPostByID(ID: Int, handler: @escaping (PostEntity) -> Void) {
        postDomainRepo.getPostByID(ID:ID) { postDomainModel in
            handler(postDomainModel)
        }
    }
}


