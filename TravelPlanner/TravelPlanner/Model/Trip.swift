//
//  Trip.swift
//  TravelPlanner
//
//  Created by François Combe on 14/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import GooglePlaces

class Trip {
    
    var id: String!
    var name: String?
    var category: Category?
    var places = [Place]()
    
    enum Category: String {
        case city = "city"
        case roadTrip = "roadTrip"
        case cruise = "cruise"
        
        var icon: UIImage? {
            return UIImage(named: rawValue)
        }
        
        static func getAll() -> [Trip.Category] {
            [city, roadTrip, cruise]
        }
    }
}
