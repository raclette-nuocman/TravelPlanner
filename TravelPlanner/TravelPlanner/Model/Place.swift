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
    
    lazy var coordinate: CLLocationCoordinate2D? = {
        gmsPlace?.coordinate
    }()
    
    lazy var formattedAddress: String? = {
        gmsPlace?.formattedAddress
    }()
    
    lazy var phoneNumber: String? = {
        gmsPlace?.phoneNumber
    }()
    
    lazy var rating: Float? = {
        gmsPlace?.rating
    }()
    
    lazy var priceLevel: GMSPlacesPriceLevel? = {
        gmsPlace?.priceLevel
    }()
    
    lazy var types: [String]? = {
        gmsPlace?.types
    }()
    
    lazy var webSite: URL? = {
        gmsPlace?.website
    }()
    
    lazy var attributions: NSAttributedString? = {
        gmsPlace?.attributions
    }()
    
    lazy var viewport: GMSCoordinateBounds? = {
        gmsPlace?.viewport
    }()
    
    lazy var addressComponents: [GMSAddressComponent]? = {
        gmsPlace?.addressComponents
    }()
    
    lazy var plusCode: GMSPlusCode? = {
        gmsPlace?.plusCode
    }()
    
    lazy var openingHours: GMSOpeningHours? = {
        gmsPlace?.openingHours
    }()
    
    lazy var userRatingsTotal: UInt? = {
        gmsPlace?.userRatingsTotal
    }()
    
    lazy var photos: [GMSPlacePhotoMetadata]? = {
        gmsPlace?.photos
    }()
    
    init(from place: GMSPlace) {
        self.gmsPlace = place
        self.name = place.name
        self.placeID = place.placeID!
    }
    
    init(id: String, name: String?) {
        self.placeID = id
        self.name = name
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
