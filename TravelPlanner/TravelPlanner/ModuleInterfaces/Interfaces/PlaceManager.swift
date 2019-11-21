//
//  PlaceManager.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

protocol PlaceManager {
    func getPlace(id: String, completion: @escaping (_ result: Result<Place?, Error>) -> Void)
}
