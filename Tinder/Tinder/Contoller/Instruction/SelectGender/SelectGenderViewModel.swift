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
            bindSelectGenderViewModelToController(gender)
        }
    }
    
    private var shouldShowGenderOnProfile:Bool{
        didSet{
            bindShouldShowGenderOnProfileToController(shouldShowGenderOnProfile)
        }
    }
    
    var bindSelectGenderViewModelToController : ((_ gender:Gender?) -> ()) = {_ in }
    var bindShouldShowGenderOnProfileToController : ((_ genderShouldShow:Bool) -> ()) = {_ in }
    
    override init() {
        shouldShowGenderOnProfile = UserProfile.shared.getUserGenderPreference()
        gender = UserProfile.shared.getUserGender()
    }
    
}


extension SelectGenderViewModel {
    /**
     Will locally store the user gender value
     */
    func didGenderChange(selectedGender:Gender) {
        gender = selectedGender
    }
    
    /**
     Will called when user choose their preference to show gender on public
     */
    func didGenderPreferenceOnProfileChange() {
        var toggledPreference:Bool = UserProfile.shared.getUserGenderPreference()
        toggledPreference = !toggledPreference
        shouldShowGenderOnProfile = toggledPreference
        // Save preference to the UserDefault
        UserProfile.shared.userShow(genderPreference: toggledPreference)
    }
    
    
    /**
        Gender is choosen
     */
    func didGenderChoose(){
        if let gender = gender {
            UserProfile.shared.user(gender: gender)
        }
    }
    
    /**
        To check if gender is decided
     */
    func isGenderChoosen() -> Bool {
        let gender:Gender? = self.gender
        if let gender = gender {
            switch gender {
            case .none:
                return false
            default:
                return true
            }
        }
        return false
    }
}
