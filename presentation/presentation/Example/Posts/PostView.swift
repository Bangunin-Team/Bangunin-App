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
    private var posts: [PostEntity] = []
    var postVM: PostVM
    public var routeToDetail: (_ passDataClosure: @escaping () -> Int ) -> Void = { _ in }
    
    private var collectionView: UICollectionView!
    
    public init(postVM: PostVM) {
        self.postVM = postVM
        super.init(nibName: nil, bundle: nil) /// init from UIViewController need to be triggered after all properties initiated
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.getPosts()
    }
    
    private func setup() {
        setupForCollectionView()
        
        self.view.addSubview(collectionView)
    }
    
    private func setupForCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
    }
    
    func getPosts() {
        postVM.getPost { [weak self] postsFromVM in
            guard let self = self else {return}
            self.posts = postsFromVM
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
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
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: navigate to detail page
        let dataPassingClossure: () -> Int = { [weak self] in
            guard let self = self else { return 0 }
            return self.posts[indexPath.row].id ?? 0
        }
        
        self.routeToDetail(dataPassingClossure)
    }
}

extension PostViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = posts[indexPath.row]
        
        let cellWidth = collectionView.frame.size.width
        let cell = PostCollectionViewCell()
        cell.titleLabel.text = data.title
        cell.bodyLabel.text = data.body
        cell.titleLabel.sizeToFit() // important to update current view size
        cell.bodyLabel.sizeToFit()
        
        let cellHeight = cell.titleLabel.frame.size.height + cell.bodyLabel.frame.size.height + 16
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
