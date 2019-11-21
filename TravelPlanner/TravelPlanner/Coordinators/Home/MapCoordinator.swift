//
//  MapCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import Pulley

class MapCoordinator: Coordinator {
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    weak var pulleyController: PulleyViewController?
    weak var mapController: MapViewController?
    
    init(in pulleyController: PulleyViewController, parent: Coordinator) {
        self.parent = parent
        self.pulleyController = pulleyController
        start()
    }
    
    func start() {
        let mapController = MapViewController { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.parent?.removeChild(coordinator: strongSelf)
        }
        self.mapController = mapController
        pulleyController?.setPrimaryContentViewController(controller: mapController)
    }
    
    
}
