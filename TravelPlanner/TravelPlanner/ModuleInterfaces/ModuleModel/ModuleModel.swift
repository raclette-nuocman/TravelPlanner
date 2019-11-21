//
//  ModuleModel.swift
//  TravelPlanner
//
//  Created by François Combe on 21/11/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation

protocol ModuleModel {

    associatedtype AppModel

    static func from(appModel: AppModel) -> Self?
    func toAppModel() -> AppModel?

}

extension ModuleModel {

    static func from(appModel: AppModel) -> Self? { nil }

}
