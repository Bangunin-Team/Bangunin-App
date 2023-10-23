//
//  PostView.swift
//  presentation
//
//  Created by FauziArda on 23/10/23.
//

import Foundation
import UIKit
import domain

public class PostViewController: UIViewController {
    var posts: [PostEntity] = []
    
    var collectionView: UICollectionView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        setup()
    }
    
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        setupForCollectionView()
        
        self.view.addSubview(collectionView)
        
        for id in 1...20 {
            posts.append(PostEntity(userID: id, id: id, title: "Title \(id)", body: "Body \(id)"))
        }
        
        collectionView.reloadData()
    }
    
    private func setupForCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
    
}

extension PostViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.titleLabel.text = posts[indexPath.row].title ?? "Title"
        cell.bodyLabel.text = posts[indexPath.row].body 
        return cell
    }
    
    
}
