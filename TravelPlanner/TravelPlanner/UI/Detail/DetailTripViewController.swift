//
//  DetailTripViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 14/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GooglePlaces

protocol TripPlaceDelegate: class {
    func selectPlace(_ place: Place)
}

class DetailTripViewController: UIViewController {
    
    weak var delegate: TripPlaceDelegate?
    var trip: Trip?
    
    @IBOutlet var tripTitleLabel: UILabel!
    var placeListViewController: TripPlacesTableViewController? {
        return children.first as? TripPlacesTableViewController
    }
    
    class func controller() -> DetailTripViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "trip") as! DetailTripViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeListViewController?.tripController = self
        updateUI()
    }
    
    func updateUI() {
        tripTitleLabel.text = trip?.name
        placeListViewController?.updateUI(with: trip?.places)
    }
    
    deinit {
        print("Detail trip view controller has been deinitialized")
    }
}
