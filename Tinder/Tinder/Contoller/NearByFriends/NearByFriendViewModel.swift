//
//  NearByFriendViewModel.swift
//  Tinder
//
//  Created by Nirbhay Singh on 15/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class NearByFriendViewModel: NSObject {
    
    // MARK:- Properties
    private var userCurrentLocation:UserLocation? {
        didSet{
            dataBindingUserLocationToController(userCurrentLocation)
        }
    }
    
    // To find the current location of the user
    private let locationManager:LocationManager!
    
    // Data Binding
    var dataBindingUserLocationToController:((_ location:UserLocation?)->()) = {_ in}
    
    // Initializer
    init(locationManager:LocationManager) {
        self.locationManager = locationManager
    }
}


extension NearByFriendViewModel {
    
    /**
     # To find the current user location, this location will be shared with the end point (server) to get the filtered friend list.
     # This current location will be stored temporary also.
     */
    private func findCurrentLocation() {
        locationManager.dataBindingCurrentUserLocationToViewModel = {userLocation in
            self.userCurrentLocation = userLocation
            self.save(userLocation: userLocation)
        }
    }
    
    /**
     *      Save the current location in UserProfile class
     *      This class will be shared across the application
     */
    private func save(userLocation:UserLocation?) {
        if let location = userLocation {
            UserProfile.shared.userChanged(location: location)
        }
    }
    
    func fetchUserLocation() {
        findCurrentLocation()
    }
}
