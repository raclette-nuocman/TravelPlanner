//
//  DetailCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import Pulley

class DetailCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    weak var pulleyController: PulleyViewController?
    weak var navigationController: UINavigationController?
    
    init(in pulleyController: PulleyViewController, parent: Coordinator) {
        self.parent = parent
        self.pulleyController = pulleyController
        start()
    }
    
    func start() {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        let controller = TripListTableViewController(dataSource: RealmTripDataSource()) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.parent?.removeChild(coordinator: strongSelf)
        }
        controller.selectionBlock = { [weak self] trip in
            self?.showDetail(for: trip)
        }
        navigationController.pushViewController(controller, animated: true)
        pulleyController?.setDrawerContentViewController(controller: navigationController)
    }
    
    private func showDetail(for trip: Trip) {
        
    }
    
}

