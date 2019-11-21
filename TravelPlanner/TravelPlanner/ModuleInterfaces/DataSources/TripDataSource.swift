//
//  TripListDataSource.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

protocol TripDataSource {
    
    var allTrips: [Trip] { get }
    var currentTrip: Trip? { get set }
    var contentDidChange: (() -> Void)? { get set }
    
    func createNewTrip(with name: String?)
}
