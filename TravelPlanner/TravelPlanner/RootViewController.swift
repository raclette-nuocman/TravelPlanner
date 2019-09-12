//
//  RootViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var currentController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapController = MapViewController.controller()
        setCurrentViewController(mapController)
    }
    
    func setCurrentViewController(_ controller: UIViewController) {
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
        
        controller.didMove(toParent: self)
    }
}
