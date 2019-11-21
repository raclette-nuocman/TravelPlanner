//
//  TripListTableViewCell.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit

class TripListTableViewCell: UITableViewCell {
    
    static var identifier = "TripListTableViewCell"

    @IBOutlet var tripNameLabel: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    func setup(with trip: Trip) {
        tripNameLabel.text = trip.name
        iconImage.image = trip.category?.icon
    }
    
    
}
