//
//  PostDetailVM.swift
//  presentation
//
//  Created by Fauzi Arda on 30/10/23.
//

import Foundation
import domain

public class PostDetailVM {
    var post: PostEntity?
    private var postInteractor: PostInteractorInterface
    
    public init(postInteractor: PostInteractorInterface) {
        self.postInteractor = postInteractor
    }
    
    func getPostByID(ID: Int, _ handler: @escaping(PostEntity) -> Void) {
        self.postInteractor.getPostByID(ID: ID) { postdata in
            self.post = postdata
            handler(self.post!)
        }
    }
}
