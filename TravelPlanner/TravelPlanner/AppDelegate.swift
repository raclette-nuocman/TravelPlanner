//
//  AppDelegate.swift
//  TravelPlanner
//
//  Created by François Combe on 24/06/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(Google.apiKey ?? "")
        GMSPlacesClient.provideAPIKey(Google.apiKey ?? "")
        return true
    }
}

