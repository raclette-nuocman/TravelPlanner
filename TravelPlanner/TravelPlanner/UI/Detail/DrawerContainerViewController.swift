//
//  DrawerContainerViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

protocol ContainerDelegate: class {
    
    func backButtonHasBeenPressed()
}

class DrawerContainerViewController: UIViewController {

    weak var delegate: ContainerDelegate?
    
    @IBOutlet var pullView: UIView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var backButton: UIButton!
    
    var currentController: UIViewController? {
        didSet {
            updateUI()
        }
    }
    
    class func controller() -> DrawerContainerViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DrawerContainerViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullView.layer.cornerRadius = pullView.frame.height / 2
        updateUI()
    }
    
    func updateUI() {
        if let controller = currentController {
            backButton.isHidden = !(type(of: controller) == DetailPlaceViewController.self)
        } else {
            backButton.isHidden = true
        }
    }
    
    func loadController(_ controller: UIViewController) {
        removeCurrentController()
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
            ])
        
        controller.didMove(toParent: self)
        currentController = controller
    }
    
    func removeCurrentController() {
        guard let controller = currentController else {
            return
        }
        controller.view.removeFromSuperview()
        controller.removeFromParent()
        currentController = nil
    }
    
    @IBAction func backButtonHasBeenPressed(_ sender: Any) {
        delegate?.backButtonHasBeenPressed()
    }
}
