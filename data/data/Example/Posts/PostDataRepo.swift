//
//  PostDataRepo.swift
//  data
//
//  Created by Fauzi Arda on 26/10/23.
//

import Foundation
import domain

public class PostDataRepo: PostDomainRepoInterface {
    var postRemoteDataSource: PostRemoteDataSourceInterface?
    var postLocalDataSource: PostLocalDataSourceInterface?
    
    public init(remote: PostRemoteDataSourceInterface? = nil, local: PostLocalDataSourceInterface? = nil) {
        self.postRemoteDataSource = remote
        self.postLocalDataSource = local
    }
    
    public func getPosts(handler: @escaping ([domain.PostEntity]) -> Void) {
        self.postRemoteDataSource?.getPosts({ postsDatafromRemote in
            var postEntity: [PostEntity] = []
            for post in postsDatafromRemote {
                postEntity.append(post.convertToPostEntity())
            }
            
            handler(postEntity)
        })
    }
    
    public func getPostByID(ID: Int, handler: @escaping (domain.PostEntity) -> Void) {
        self.postRemoteDataSource?.getPostByID(ID: ID){ postDataModel in
            var postEntity = postDataModel.convertToPostEntity()
            handler(postEntity)
        }
    }
}
