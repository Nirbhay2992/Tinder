//
//  Constant.swift
//  Tinder
//
//  Created by Administrator on 14/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation

enum LoginSource:String {
    case google = "Google"
    case facebook = "Facebook"
    case unknown = "Unknown"
    
    func getRawValue() -> String {
        
        switch self {
        case .google:
            return self.rawValue
        case .facebook:
            return self.rawValue
        case .unknown:
            return self.rawValue
        }
    }
}


struct StoryboardIdentifier {
    static let main = "Main"
}
