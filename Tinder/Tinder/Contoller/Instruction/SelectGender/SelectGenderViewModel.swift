//
//  SelectGenderViewModel.swift
//  Tinder
//
//  Created by Nirbhay Singh on 14/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class SelectGenderViewModel: NSObject {

    private var gender:Gender?{
        didSet{
            bindSelectGenderViewModelToController()
        }
    }
    
    var bindSelectGenderViewModelToController : (() -> ()) = {}
    
    override init() {
        
    }
    
}


extension SelectGenderViewModel {
    /**
     Will locally store the user gender value
     */
    func didGenderChange(selectedGender:Gender) {
        gender = selectedGender
        UserProfile.shared.user(gender: selectedGender)
    }
}
