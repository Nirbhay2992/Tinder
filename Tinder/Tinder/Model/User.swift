//
//  User.swift
//  Tinder
//
//  Created by Administrator on 13/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation



// MARK: - BaseModal

struct BaseResponse<T:Codable> :Codable {
    let status:Int?
    let message:String?
    var result:T?
    
    enum CodingKeys: String, CodingKey {
        case status = "CODE"
        case message = "MESSAGE"
        case result = "RESULT"
    }
}

struct LoginResponse : Codable{
    var emailID:String?
    enum CodingKeys: String, CodingKey {
        case emailID = "email"
    }
}

struct User:Codable{
    var name:String?
    var deviceId:String?
    var id:String?            // id represent the social media id
    var emailID:String?
    var profilePhotoUrl:String?
    var loginSource:Int? // Facebook/Google
    
    init(name:String?, id:String?, email:String?,profilePhotoUrl:String?,loginSource:Int?) {
        self.name = name
        self.id = id
        self.deviceId = id
        self.emailID = email
        self.profilePhotoUrl = profilePhotoUrl
        self.loginSource = loginSource
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "social_id"
        case emailID = "email"
        case profilePhotoUrl
        case deviceId = "device_id"
        case loginSource = "login_type"
    }
}


extension User : Hashable{
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
        hasher.combine(loginSource)
    }
}

extension User : Equatable{
    static func == (lhs: User, rhs: User) -> Bool{
        return lhs.id == rhs.id
    }
}

struct UserManager {
    
    private var user:User?
    private let userKey = "user"
    static var shared:UserManager = UserManager()
    
    init() {
        user = getUserFromUserDefault()
    }
    
    func getCurrentUser() -> User? {
        return user
    }
    
    mutating func setUser(user:User) {
        self.user = user
        save(user: user)
    }
    
    // User Default
    private func save(user:User) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey:userKey)
    }
    
    private func getUserFromUserDefault() ->User? {
        if let data = UserDefaults.standard.value(forKey:userKey) as? Data {
            let user = try? PropertyListDecoder().decode(User.self, from: data)
            return user
        }
        return nil
    }
    
    // Login Session
    
    public func isSessionExpired()->Bool{
        //let user:User? =  getUserFromUserDefault()
        //TODO:- Manage the user session
        return true
    }
    
    public func getNewUser()->User{
        let loggedInUser = User.init(name: String(), id: String(), email: String(), profilePhotoUrl: String(), loginSource:SocialMediaSource.unknown.rawValue)
        return loggedInUser
    }
}
