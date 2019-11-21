//
//  Coordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

enum CoordinatorNavigationStyle {
    case present
    case push
}

protocol Coordinator: class {
    
    var parent: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
    
}

// MARK: - Children management -
extension Coordinator {
    
    func addChild(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }

}
