//
//  RealmTripDataSource.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

class RealmTripDataSource: TripDataSource {
    
    var allTrips: [Trip] = [] { didSet { contentDidChange?() } }
    var contentDidChange: (() -> Void)?
    
    var currentTrip: Trip?
    
    init() {
        let trip = createNewTrip()
        currentTrip = trip
    }
    
    func createNewTrip() -> Trip {
        let newTrip = Trip()
        newTrip.id = UUID().uuidString.lowercased()
        newTrip.name = "My trip"
        allTrips.append(newTrip)
        return newTrip
    }
    
    func addPlaceToTrip(place: Place, trip: Trip, completion: @escaping (Error?) -> Void) {
        guard allTrips.map({ $0.id }).contains(trip.id) else {
            let error = NSError.createError(message: "You attempt to add a place to an unknown trip!")
            completion(error)
            return
        }
        trip.places.append(place)
        completion(nil)
    }
}
