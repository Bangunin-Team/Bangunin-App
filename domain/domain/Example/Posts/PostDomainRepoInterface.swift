//
//  PostDomainRepoInterface.swift
//  domain
//
//  Created by FauziArda on 23/10/23.
//

import Foundation

public protocol PostDomainRepoInterface {
    func getPosts(handler: @escaping ([PostEntity]) -> Void)
    func getPostByID(ID: Int, handler: @escaping (PostEntity) -> Void)
}
