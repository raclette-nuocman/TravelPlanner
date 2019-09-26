//
//  MainCoordinator.swift
//  TravelPlanner
//
//  Created by François Combe on 12/09/2019.
//  Copyright © 2019 francois. All rights reserved.
//

import UIKit
import Pulley
import GooglePlaces

class MainCoordinator {
    
    static let shared = MainCoordinator()
    
    var pulleyController = PulleyManagerViewController.controller()
    var mapController = MapViewController.controller()
    var detailContainerController = DrawerContainerViewController.controller()
    var detailPlaceController: DetailPlaceViewController? {
        return detailContainerController.currentController as? DetailPlaceViewController
    }
    var detailTripController: DetailTripViewController!
    
    func initViewControllers() {
        pulleyController.setPrimaryContentViewController(controller: mapController)
        pulleyController.setDrawerContentViewController(controller: detailContainerController)
        detailContainerController.delegate = self
        pulleyController.delegate = self
        mapController.delegate = self
        detailTripController = DetailTripViewController.controller()
        detailTripController.trip = TripManager.shared.currentTrip
        detailTripController.delegate = self
        showTripController()
    }
    
    func showTripController() {
        detailContainerController.loadController(detailTripController)
        detailTripController.updateUI()
    }
    
    func showPlaceController() {
        let detailPlaceController = DetailPlaceViewController.controller()
        detailPlaceController.delegate = self
        detailContainerController.loadController(detailPlaceController)
    }
    
    func getPlaceInfos(id: String) {
        GooglePlacesAPIManager.shared.getPlace(id: id) { [weak self] (place, error) in
            if let error = error {
                self?.showError(error)
            } else if let place = place {
                self?.detailPlaceController?.place = place
                self?.detailPlaceController?.showActivityIndicator(false)
            }
        }
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Ooops", message: error.localizedDescription, preferredStyle: .alert)
        pulleyController.present(alert, animated: true, completion: nil)
    }
    
}

extension MainCoordinator: PulleyDelegate {

}

extension MainCoordinator: MapDelegate {
    
    func map(_ mapController: MapViewController, didSelect pointOfInterest: String, name: String) {
        showPlaceController()
        detailPlaceController?.showActivityIndicator(true)
        pulleyController.showPartially()
        getPlaceInfos(id: pointOfInterest)
    }
}

extension MainCoordinator: DetailPlaceDelegate {
    
    func addPlaceToTrip(_ place: Place, completion: @escaping (Bool) -> Void) {
        TripManager.shared.addPlaceToTrip(place: place, trip: TripManager.shared.currentTrip!) { [weak self] (error) in
            if let error = error {
                self?.showError(error)
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}

extension MainCoordinator: ContainerDelegate {
    func backButtonHasBeenPressed() {
        showTripController()
    }
}

extension MainCoordinator: TripPlaceDelegate {
    
    func selectPlace(_ place: Place) {
        showPlaceController()
        detailPlaceController?.place = place
    }
}
