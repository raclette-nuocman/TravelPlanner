//
//  RealmTripDataSource.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import RealmSwift

class RealmTripDataSource: TripDataSource {
    
    private var currentRTrips: Results<RTrip>
    private var tripNotificationToken: NotificationToken?
    
    var allTrips: [Trip] = [] { didSet { contentDidChange?() } }
    var contentDidChange: (() -> Void)?
    
    var currentTrip: Trip?
    
    init() {
        let realm = try! Realm()
        self.currentRTrips = realm.objects(RTrip.self)
        self.allTrips = currentRTrips.compactMap { $0.toAppModel() }
        setupSynchronization()
    }
    
    deinit {
        tripNotificationToken?.invalidate()
    }
    
    func setupSynchronization() {
        tripNotificationToken = currentRTrips.observe { [weak self] (changes) in
            guard let strongSelf = self else { return }
            switch changes {
            case .update(let trips, let deletions, let insertions, let modifications):
                for deletedIndex in deletions.reversed() {
                    strongSelf.allTrips.remove(at: deletedIndex)
                }
                
                for insertIndex in insertions {
                    guard let newObject = trips[insertIndex].toAppModel() else { break }
                    strongSelf.allTrips.insert(newObject, at: insertIndex)
                }
                
                for updateIndex in modifications {
                    guard let newObject = trips[updateIndex].toAppModel() else { break }
                    strongSelf.allTrips.remove(at: updateIndex)
                    strongSelf.allTrips.insert(newObject, at: updateIndex)
                }

            default:
                break
            }
        }
    }
    
    func createNewTrip(with name: String?) {
        let newTrip = Trip()
        newTrip.id = UUID().uuidString.lowercased()
        newTrip.name = name.nilOrEmpty() ?? "My trip \(allTrips.count)"
        newTrip.category = Trip.Category.getAll().shuffled().first!
        
        guard let newObject = RTrip.from(appModel: newTrip) else { return }
        updateAndSync(trip: newObject)
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
    
    // MARK: - Synchronization functions
    
    private func updateAndSync(trip: RTrip) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(trip)
        }
    }

}
