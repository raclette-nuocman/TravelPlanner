//
//  MainCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class MainCoordinator {
    
    static let shared = MainCoordinator()
    
    var pulleyController = PulleyManagerViewController.controller()
    var mapController = MapViewController.controller()
    var detailContainerController = DrawerContainerViewController.controller()
    var detailController: DetailViewController {
        return detailContainerController.children.first as! DetailViewController
    }
    
    func initViewControllers() {
        pulleyController.setPrimaryContentViewController(controller: mapController)
        pulleyController.setDrawerContentViewController(controller: detailContainerController)
        mapController.delegate = self
    }
}

extension MainCoordinator: MapDelegate {
    func map(_ mapController: MapViewController, didSelect pointOfInterest: String, name: String) {
        detailController.setTitle(name)
    }
    
    
}
