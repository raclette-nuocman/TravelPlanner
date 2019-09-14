//
//  DrawerContainerViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class DrawerContainerViewController: UIViewController {

    @IBOutlet var pullView: UIView!
    @IBOutlet var containerView: UIView!
    
    class func controller() -> DrawerContainerViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DrawerContainerViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullView.layer.cornerRadius = pullView.frame.height / 2
    }
}
