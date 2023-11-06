//
//  PostDetailView.swift
//  presentation
//
//  Created by Fauzi Arda on 30/10/23.
//

import Foundation
import UIKit

public class PostDetailViewController: UIViewController {
    var postDetailVM: PostDetailVM
    
    public var passDataRoute: () -> Int = {0}
    
    let titleLabel: UILabel =  {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let body: UILabel =  {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public init(postDetailVM: PostDetailVM) {
        self.postDetailVM = postDetailVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.postDetailVM.getPostByID(ID: self.passDataRoute()) { [weak self] postData in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.titleLabel.text = postData.title
                self.body.text = postData.body
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(titleLabel)
        self.view.addSubview(body)
        
        setupConstraintsForTitleLabel()
        setupConstraintsForBody()
    }
    
    private func setupConstraintsForTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupConstraintsForBody() {
        NSLayoutConstraint.activate([
            body.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            body.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            body.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        ])
    }
    
    
}
