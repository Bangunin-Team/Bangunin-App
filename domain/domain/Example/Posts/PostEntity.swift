//
//  PostEntity.swift
//  domain
//
//  Created by FauziArda on 23/10/23.
//

import Foundation

public struct PostEntity: Identifiable {
    public let userID: Int?
    public let id: Int?
    public let title: String?
    public let body: String
    
    init(userID: Int?, id: Int?, title: String?, body: String) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
}
