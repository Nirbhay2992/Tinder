//
//  File.swift
//  Tinder
//
//  Created by Nirbhay Singh on 17/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation

enum BaseURL : String {
    case development = "https://www.parloannidhi.com/tinder/public/"
    case production = "https://production"
    
    static func getEndURL(function:Function) -> String {
        
        switch function {
        case .login: return CurrentBaseURL.getURL(function: function)
        }
    }
}

enum Function : String {
    case login = "login-user"
}


private struct CurrentBaseURL {
    static let URL = BaseURL.development.rawValue
    static let version = "api/v1/"
    
    static func getURL(function:Function)->String{
        return "\(URL)" + "\(version)"+"\(function.rawValue)"
    }
}
