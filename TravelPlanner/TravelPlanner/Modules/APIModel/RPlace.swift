//
//  RPlace.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import RealmSwift

final class RPlace: Object {
    @objc dynamic var id: String!
    @objc dynamic var name: String?
}

extension RPlace: ModuleModel {
    typealias AppModel = Place
    
    func toAppModel() -> Place? {
        return Place(id: self.id, name: self.name)
    }
    
    static func from(appModel: Place) -> RPlace? {
        let place = RPlace()
        place.id = appModel.placeID
        return place
    }
}
