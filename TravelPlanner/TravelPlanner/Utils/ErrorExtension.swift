//
//  Utils.swift
//  TravelPlanner
//
//  Created by François Combe on 14/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

extension NSError {
    
    class func createError(message: String) -> NSError {
        return NSError(domain: Bundle.main.bundleIdentifier!, code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
