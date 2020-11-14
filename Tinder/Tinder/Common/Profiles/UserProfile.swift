//
//  UserProfile.swift
//  Tinder
//
//  Created by Nirbhay Singh on 14/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation


/**
 Protocol for getting/setting the user gender
 */
protocol UserGenderChoosen {
    mutating func user(gender:Gender)
    func getUserGender()->Gender
}


/**
 All available gender
 */
enum Gender:String {
    case male = "Male"
    case femail = "Female"
    case other = "Other"
    case none = "NA"
}

/**
 Will hold the all attribute related with the user profile
 */
struct UserProfile {
    // Singalton object
    static var shared:UserProfile = UserProfile()
   
    // Hold the currently selected gender value
    private var gender:Gender?
}

extension UserProfile: UserGenderChoosen {
    func getUserGender() -> Gender {
        gender ?? .none
    }

    mutating func user(gender: Gender) {
        self.gender = gender
    }
}
