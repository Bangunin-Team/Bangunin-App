//
//  PostModel.swift
//  data
//
//  Created by Fauzi Arda on 26/10/23.
//

import Foundation
import domain

public struct PostModel: Decodable {
    public let userID: Int?
    public let id: Int?
    public let title: String?
    public let body: String
    
    public init(userID: Int?, id: Int?, title: String?, body: String) {
        self.userID = userID
        self.id = id
        self.title = title
        self.body = body
    }
    
    func convertToPostEntity() -> domain.PostEntity {
        return PostEntity(userID: self.userID, id: self.id, title: self.title, body: self.body)
    }
}
