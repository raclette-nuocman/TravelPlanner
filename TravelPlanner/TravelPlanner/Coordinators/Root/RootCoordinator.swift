//
//  RootCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    var window: UIWindow!
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    func start() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeCoordinator = HomeCoordinator(in: window, parent: self)
        addChild(coordinator: homeCoordinator)
    }
}
