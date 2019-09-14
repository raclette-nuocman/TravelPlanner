//
//  PulleyManagerViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import Pulley

class PulleyManagerViewController: PulleyViewController {
    
    class func controller() -> PulleyManagerViewController {
        return UIStoryboard(name: "Pulley", bundle: nil).instantiateInitialViewController() as! PulleyManagerViewController
    }
    
    func showPartially() {
        setDrawerPosition(position: .partiallyRevealed, animated: true)
    }
    
    func showFully() {
        setDrawerPosition(position: .open, animated: true)
    }
    
    func collapse() {
        setDrawerPosition(position: .collapsed, animated: true)
    }
    
    func hide() {
        setDrawerPosition(position: .closed, animated: true)
    }
}
