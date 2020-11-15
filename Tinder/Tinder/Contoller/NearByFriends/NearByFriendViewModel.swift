//
//  NearByFriendViewModel.swift
//  Tinder
//
//  Created by Nirbhay Singh on 15/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class NearByFriendViewModel: NSObject {

    private var userCurrentLocation:UserLocation? {
        didSet{
            
        }
    }
    
    override init() {
        
    }
}


extension NearByFriendViewModel {
    
    /**
            # To find the current user location, this location will be shared with the end point (server) to find out the filtered friend list.
            # This current location will be stored temporary also.
     */
    func findCurrentLocation() {
        
    }
}
