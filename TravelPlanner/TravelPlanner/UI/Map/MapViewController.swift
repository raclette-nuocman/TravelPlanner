//
//  ViewController.swift
//  TravelPlanner
//
//  Created by François Combe on 24/06/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

protocol MapDelegate: class {
    
    func map(_ mapController: MapViewController, didSelect pointOfInterest: String, name: String)
}

class MapViewController: UIViewController {

    private let locationManager = CLLocationManager()
    
    weak var delegate: MapDelegate?

    var mapView: GMSMapView? {
        return view as? GMSMapView
    }
    
    var deinitBlock: (() -> Void)?
    
    private var userLocation: CLLocation? {
        didSet {
            if oldValue == nil, let location = userLocation {
                zoom(to: location.coordinate)
            }
        }
    }
    
    convenience init(deinitBlock: @escaping () -> Void) {
        self.init(nibName: nil, bundle: nil)
        self.deinitBlock = deinitBlock
    }
    
    deinit {
        deinitBlock?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMapView()
        initLocationAuthorization()
    }

    private func initMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 44, longitude: -6, zoom: 9)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.delegate = self
        view = mapView
    }
    
    private func loadMapStyle() {
        if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
            mapView?.mapStyle = try! GMSMapStyle(contentsOfFileURL: styleURL)
        }
    }

    private func initLocationAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
    }
    
    func selectPlace(at location: CLLocationCoordinate2D) {
        zoom(to: location)
    }

    private func zoom(to location: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition.camera(withTarget: location, zoom: 15)
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

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        selectPlace(at: location)
        delegate?.map(self, didSelect: placeID, name: name)
    }
}
