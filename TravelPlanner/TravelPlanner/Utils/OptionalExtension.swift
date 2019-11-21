//
//  OptionalExtension.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    
    func nilOrEmpty() -> String? {
        if let some = self {
            return some.isEmpty ? nil : some
        } else {
            return nil
        }
    }
}
