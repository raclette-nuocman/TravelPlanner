//
//  DetailViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GooglePlaces

protocol DetailPlaceDelegate: class {
    
    func addPlaceToTrip(_ place: GMSPlace, completion: @escaping (_ succeed: Bool) -> Void)
}

class DetailPlaceViewController: UITableViewController {

    var place: GMSPlace? {
        didSet {
            self.updateUI()
        }
    }
    
    weak var delegate: DetailPlaceDelegate?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var addToTripButton: UIButton!
    
    @IBOutlet var cellsToHideDuringLoading: [UITableViewCell]!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    class func controller() -> DetailPlaceViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "place") as! DetailPlaceViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        setFakeHeaderView()
        updateUI()
    }
    
    func updateUI() {
        guard let place = place else {
            return
        }
        titleLabel.text = place.name
        addressLabel.text = place.formattedAddress
        updateAddToTripButton()
    }
    
    func updateAddToTripButton() {
        addToTripButton.layer.cornerRadius = addToTripButton.frame.height / 2
        guard let place = place else {
            return
        }
        if let trip = TripManager.shared.currentTrip {
            addToTripButton.isHidden = false
            if trip.places.contains(place) {
                addToTripButton.titleLabel?.text = "Added"
                addToTripButton.backgroundColor = #colorLiteral(red: 0.2039999962, green: 0.7799999714, blue: 0.3490000069, alpha: 1)
                addToTripButton.isEnabled = false
            } else {
                addToTripButton.titleLabel?.text = "Add to trip"
                addToTripButton.backgroundColor = #colorLiteral(red: 0, green: 0.4779999852, blue: 1, alpha: 1)
                addToTripButton.isEnabled = true
            }
        } else {
            addToTripButton.isHidden = true
        }
    }
    
    func showActivityIndicator(_ value: Bool) {
        activityIndicator.isHidden = !value
        cellsToHideDuringLoading.forEach { (cell) in
            cell.isHidden = value
        }
        addToTripButton.isHidden = value
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    @IBAction func addToTripButtonHasBeenPressed(_ sender: UIButton) {
        guard let place = place else {
            return
        }
        delegate?.addPlaceToTrip(place) { [weak self] _ in
            self?.updateAddToTripButton()
        }
    }
    
    func setFakeHeaderView() {
        let fakeHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 0.5))
        fakeHeaderView.backgroundColor = .clear
        tableView.tableHeaderView = fakeHeaderView
    }
    
    deinit {
        print("Detail place has been deinitialized")
    }
}
