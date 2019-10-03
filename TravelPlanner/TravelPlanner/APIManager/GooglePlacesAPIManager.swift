//
//  GooglePlacesAPIManager.swift
//  TravelPlanner
//
//  Created by François Combe on 14/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation
import GooglePlaces

class GooglePlacesAPIManager {
    
    static let shared = GooglePlacesAPIManager()
    
    let placesClient = GMSPlacesClient()
    
    func getPlace(id: String, completion: @escaping GMSPlaceResultCallback) {
        let fields = GMSPlaceField(rawValue: GMSPlaceField.all.rawValue)!
        
        placesClient.fetchPlace(fromPlaceID: id, placeFields: fields, sessionToken: nil) { (gmsPlace, error) in
            if let error = error {
                completion(nil, error)
            } else if let place = gmsPlace {
                completion(place, nil)
            } else {
                let error = NSError.createError(message:  "An unknown error has been encountered while fetching the place.")
                completion(nil, error)
            }
        }
    }
}
