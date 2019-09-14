//
//  DetailViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GooglePlaces

class DetailViewController: UITableViewController {

    var place: GMSPlace? {
        didSet {
            self.updateInfos()
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    
    class func controller() -> DetailViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        updateInfos()
    }
    
    func updateInfos() {
        guard let place = place else {
            return
        }
        titleLabel.text = place.name
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
