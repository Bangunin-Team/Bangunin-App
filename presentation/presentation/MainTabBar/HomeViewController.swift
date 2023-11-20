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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.view = loadMap()
    }
}
