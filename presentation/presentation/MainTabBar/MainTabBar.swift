//
//  MainTabBar.swift
//  presentation
//
//  Created by Fauzi Arda on 06/11/23.
//

import Foundation
import UIKit

public class MainTabBarViewController: UITabBarController {
    public var makeHomeViewController: () -> UIViewController = { HomeViewController() }
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setup()
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.tabBar.backgroundColor = .lightGray.withAlphaComponent(0.5)
        let homeViewController = makeHomeViewController()
        let alarmsViewController = AlarmsViewController()
        
        // Set the view controllers for the tab bar controller
        self.viewControllers = [homeViewController, alarmsViewController]
        
        // Configure the tab bar items for each view controller
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        alarmsViewController.tabBarItem = UITabBarItem(title: "Alarms", image: UIImage(systemName: "alarm.fill"), tag: 1)
        //    settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 2)
    }
}
