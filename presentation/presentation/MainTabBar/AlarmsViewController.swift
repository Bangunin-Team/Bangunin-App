//
//  AlarmsViewController.swift
//  presentation
//
//  Created by Fauzi Arda on 06/11/23.
//

import Foundation
import UIKit

public class AlarmsViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
