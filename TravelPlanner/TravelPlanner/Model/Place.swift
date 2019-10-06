//
//  Place.swift
//  TravelPlanner
//
//  Created by François Combe on 23/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import GooglePlaces

class Place {
    
    private var gmsPlace: GMSPlace?
    
    var placeID: String
    
    var name: String?
    
    var coordinate: CLLocationCoordinate2D? {
        gmsPlace?.coordinate
    }
    
    var formattedAddress: String? {
        gmsPlace?.formattedAddress
    }
    
    var phoneNumber: String? {
        gmsPlace?.phoneNumber
    }
    
    var rating: Float? {
        gmsPlace?.rating
    }
    
    var priceLevel: GMSPlacesPriceLevel? {
        gmsPlace?.priceLevel
    }
    
    var types: [String]? {
        gmsPlace?.types
    }
    
    var webSite: URL? {
        gmsPlace?.website
    }
    
    var attributions: NSAttributedString? {
        gmsPlace?.attributions
    }
    
    var viewport: GMSCoordinateBounds? {
        gmsPlace?.viewport
    }
    
    var addressComponents: [GMSAddressComponent]? {
        gmsPlace?.addressComponents
    }
    
    var plusCode: GMSPlusCode? {
        gmsPlace?.plusCode
    }
    
    var openingHours: GMSOpeningHours? {
        gmsPlace?.openingHours
    }
    
    var userRatingsTotal: UInt? {
        gmsPlace?.userRatingsTotal
    }
    
    var photos: [GMSPlacePhotoMetadata]? {
        gmsPlace?.photos
    }
    
    init(from place: GMSPlace) {
        self.gmsPlace = place
        self.name = place.name
        self.placeID = place.placeID!
    }
    
    init(id: String, name: String?) {
        self.placeID = id
        self.name = name
    }
    
    func update(with gmsPlace: GMSPlace) {
        self.gmsPlace = gmsPlace
    }
    
    var isComplete: Bool {
        return formattedAddress != nil
    }
}

extension Place: Equatable {
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.placeID == rhs.placeID
    }
}
