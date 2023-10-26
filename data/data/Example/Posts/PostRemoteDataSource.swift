//
//  PostRemoteDataSource.swift
//  data
//
//  Created by Fauzi Arda on 26/10/23.
//

import Foundation

public protocol PostRemoteDataSourceInterface {
    init(urlString: String)
    func getPosts(_ handler: @escaping ([PostModel]) -> Void)
}

public class PostRemoteDataSource: PostRemoteDataSourceInterface {
    let urlString: String!
    
    required public init(urlString: String) {
        self.urlString = urlString
    }
    
    public func getPosts(_ handler: @escaping ([PostModel]) -> Void) {
        guard let url = URL(string: urlString) else { return handler([]) }
        
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            guard let data = data else { return handler([]) }
            
            guard let postModels = try? JSONDecoder().decode([PostModel].self, from: data) else { return handler([])}
            
            handler(postModels)
        }
        task.resume()
    }
}
