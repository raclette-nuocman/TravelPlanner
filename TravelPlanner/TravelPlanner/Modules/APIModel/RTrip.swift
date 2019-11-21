//
//  RTrip.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import RealmSwift

final class RTrip: Object {
    @objc dynamic var id: String!
    @objc dynamic var name: String?
    var places: List<RPlace> = List<RPlace>()
}

extension RTrip: ModuleModel {

    typealias AppModel = Trip
    
    func toAppModel() -> Trip? {
        let trip = Trip()
        trip.id = self.id
        trip.name = self.name
        return trip
    }
    
    static func from(appModel: Trip) -> RTrip? {
        let trip = RTrip()
        trip.id = appModel.id
        trip.name = appModel.name
        trip.places.append(objectsIn: appModel.places.compactMap { RPlace.from(appModel: $0) })
        return trip
    }
}
