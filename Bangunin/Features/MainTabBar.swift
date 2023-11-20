//
//  MainTabBar.swift
//  Bangunin
//
//  Created by Fauzi Arda on 20/11/23.
//

import Foundation
import Foundation
import presentation
import UIKit
import GoogleMaps

struct MainTabBarUIComposer {
    static func makeTabBar() -> UITabBarController {
        let controller = MainTabBarViewController()
        controller.makeHomeViewController = makeHomeViewController

        return controller
    }
    
    private static func makeHomeViewController() -> UIViewController {
        let homeController = HomeViewController()
        let camera:GMSCameraPosition = GMSCameraPosition.camera(withLatitude: -6.230549777155396, longitude: 106.84466959353516, zoom: 15)
        let mapView = GMSMapView(frame: .zero, camera: camera)
        let mapDelegate = MapViewDelegateClass()
        mapView.delegate = mapDelegate

        homeController.loadMap = {
            return mapView
        }
        return homeController
    }
}

class MapViewDelegateClass: NSObject, GMSMapViewDelegate {

}
