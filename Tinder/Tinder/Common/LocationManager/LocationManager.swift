//
//  LocationManager.swift
//  Tinder
//
//  Created by Nirbhay Singh on 14/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    
    private var userLocation:UserLocation? {
        didSet{
            dataBindingCurrentUserLocationToViewModel(userLocation)
        }
    }
    
    var dataBindingCurrentUserLocationToViewModel:((_ location:UserLocation?)->()) = {_ in}
    
    override init() {
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = .greatestFiniteMagnitude
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let currentUserLocation = UserLocation(latitude: locValue.latitude, longitude: locValue.longitude, address: String())
        self.userLocation = currentUserLocation
    }
}
