//
//  Constants.swift
//  TravelPlanner
//
//  Created by François Combe on 04/08/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import Foundation


struct Config: Decodable {

    static let configFile = Bundle.main.url(forResource: "config", withExtension: "json")
    
    var isDevMode: Bool?
    var googleAPIKey: String?
}

struct Google {
    
    static var apiKey: String? {
        let data = try! Data(contentsOf: Config.configFile!)
        do {
            let config = try JSONDecoder().decode(Config.self, from: data)
            return config.googleAPIKey
        } catch {
            print(error)
            return nil
        }
    }
}
