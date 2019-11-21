//
//  HomeCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    weak var window: UIWindow?
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var homeController: HomeViewController?
    
    init(in window: UIWindow, parent: Coordinator) {
        self.window = window
        self.parent = parent
        start()
    }
    
    func start() {
        let controller = HomeViewController()
        self.homeController = controller
        let mapCoordinator = MapCoordinator(in: controller, parent: self)
        addChild(coordinator: mapCoordinator)
        let detailCoordinator = DetailCoordinator(in: controller, parent: self)
        addChild(coordinator: detailCoordinator)
        window?.rootViewController = homeController
        window?.makeKeyAndVisible()

    }
    
    
}
