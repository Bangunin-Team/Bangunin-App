//
//  HomeViewController.swift
//  presentation
//
//  Created by Fauzi Arda on 06/11/23.
//

import Foundation
import UIKit

public class HomeViewController: UIViewController {
    
    public var loadMap: () ->UIView = { UIView() }
    
    private let currentLocationButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "currentLocation")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.tintColor = .gray
        button.addTarget(self, action: #selector(currentLocationButtonDidClicked), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.view = loadMap()
        self.setupView()
    }
    
    private func setupView() {
        self.view.addSubview(currentLocationButton)
        setupConstraintsForCurrentLocationButton()
    }
    
    private func setupConstraintsForCurrentLocationButton() {
        NSLayoutConstraint.activate([
            currentLocationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            currentLocationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 50),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func currentLocationButtonDidClicked() {
        print("CurrentLocationButton Did Clicked!")
    }
}
