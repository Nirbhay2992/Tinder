//
//  NearByFriendsViewController.swift
//  Tinder
//
//  Created by Nirbhay Singh on 15/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class NearByFriendsViewController: BaseViewController {

    // MARK:- IBOutlets and Properties
    // ViewModel
    private var viewModel:NearByFriendViewModel!
    
    // MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

private extension NearByFriendsViewController{
    func initViewModel() {
        viewModel = NearByFriendViewModel(locationManager: LocationManager())
        viewModel.fetchUserLocation()
        viewModel.dataBindingUserLocationToController = { userLocation in
            if let location:UserLocation? = userLocation {
                print("controller class \(location)")
            }
        }
    }
}
