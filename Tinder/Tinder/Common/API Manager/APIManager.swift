//
//  APIManager.swift
//  Tinder
//
//  Created by Nirbhay Singh on 17/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class APIManager: NSObject {

    func performLogin(user:User) {
        let urlString = BaseURL.getEndURL(function: .login)
    }
}
