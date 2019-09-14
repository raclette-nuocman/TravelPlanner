//
//  TripManager.swift
//  TravelPlanner
//
//  Created by François Combe on 14/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import GooglePlaces

class TripManager {
    
    static let shared = TripManager()
    
    var allTrips = [Trip]()
    var currentTrip: Trip?
    
    func loadTrips() {
        let trip = createNewTrip()
        currentTrip = trip
    }
    
    func createNewTrip() -> Trip {
        let newTrip = Trip()
        newTrip.id = UUID().uuidString.lowercased()
        allTrips.append(newTrip)
        return newTrip
    }
    
    func addPlaceToTrip(place: GMSPlace, trip: Trip, completion: @escaping (Error?) -> Void) {
        guard allTrips.map({ $0.id }).contains(trip.id) else {
            let error = NSError.createError(message: "You attempt to add a place to an unknown trip!")
            completion(error)
            return
        }
        trip.places.append(place)
        completion(nil)
    }

}
