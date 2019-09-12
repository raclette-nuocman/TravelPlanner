//
//  ViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 24/06/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    private let locationManager = CLLocationManager()

    var mapView: GMSMapView? {
        return view as? GMSMapView
    }

    private var userLocation: CLLocation? {
        didSet {
            if oldValue == nil, let location = userLocation {
                zoom(to: location)
            }
        }
    }

    class func controller() -> MapViewController {
        let controller = UIStoryboard(name: "Map", bundle: nil).instantiateInitialViewController() as! MapViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMapView()
        initLocationAuthorization()
    }

    private func initMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 44, longitude: -6, zoom: 9)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
    }

    private func initLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    }

    private func zoom(to location: CLLocation) {
        let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15)
        mapView?.animate(to: camera)
    }
}

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            userLocation = location
        }
    }
}

