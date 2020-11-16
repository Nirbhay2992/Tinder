//
//  UserLocation.swift
//  Tinder
//
//  Created by Nirbhay Singh on 15/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation

/**
 To hold the current location of the user
 */
struct UserLocation {
    private var latitude:Double!
    private var longitude:Double!
    private var address:String!
    
    init(latitude:Double, longitude:Double, address:String) {
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
}
