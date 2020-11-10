//
//  User.swift
//  Tinder
//
//  Created by Administrator on 13/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation


struct User:Codable{
    var name:String?
    var is_silhouette:Bool?
    var id:String?
    var emailID:String?
    var profilePhotoUrl:String?
    var loginSource:String? // Facebook/Google
    var userLogout:Bool?
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
        let user:User? =  getUserFromUserDefault()
        return user?.userLogout ?? true
    }
    
    public func getNewUser()->User{
        let loggedInUser = User.init(name: String(), is_silhouette: Bool(), id: String(), emailID: String(), profilePhotoUrl: String(), loginSource:LoginSource.unknown.getRawValue(), userLogout: false)
        return loggedInUser
    }
}
