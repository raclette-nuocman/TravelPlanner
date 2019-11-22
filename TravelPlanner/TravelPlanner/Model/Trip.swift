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
        case museum
        case roadTrip
        case cruise
        case backpacker
        case moutain
        case beach
        
        var icon: UIImage? {
            switch self {
            case .museum:
                return Asset.Images.museum.image
            case .roadTrip:
                return Asset.Images.van.image
            case .cruise:
                return Asset.Images.cruise.image
            case .backpacker:
                return Asset.Images.backpacker.image
            case .moutain:
                return Asset.Images.mountain.image
            case .beach:
                return Asset.Images.beach.image
            }
        }
        
        static func getAll() -> [Trip.Category] {
            [museum, roadTrip, cruise, backpacker, moutain, beach]
        }
    }
}
