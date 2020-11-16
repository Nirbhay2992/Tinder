//
//  LoginViewModel.swift
//  Tinder
//
//  Created by Administrator on 12/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare
import GoogleSignIn

protocol LoginViewModelDelegate {
    func didLoginSuccessfully()
    func didLoginFail()
}

class LoginViewModel: NSObject {
    
    // Delegate
    var delegate:LoginViewModelDelegate?
    // typealias
    typealias LoginCompletionBlock = (_ isNetworkAvailable:Bool?, _ error:Error?)->Void
    // Properties
    var fbLoginManager : LoginManager = LoginManager()
    
    
    override init() {
        super.init()
        GIDSignIn.sharedInstance().clientID = Google.clientKey
        GIDSignIn.sharedInstance().delegate = self
    }
    
    /**
     `Set/Get` the login user
     */
    public func set(user:User){
        UserManager.shared.setUser(user: user)
    }
    
    public func getUser()-> User{
        return UserManager.shared.getCurrentUser() ?? getLogoutUser()
    }
    
    public func getLogoutUser()->User{
        let loggedInUser = UserManager.shared.getNewUser()
        return loggedInUser
    }
}


// Googel Login
extension LoginViewModel : GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }

        let userId = user.userID  // For client-side use only!
        let email = user.profile.email
        let profileUrl = user.profile.imageURL(withDimension: 200)
        let fullName = user.profile.name
        
        let newUser = User.init(name: fullName, id: userId, emailID: email, profilePhotoUrl: profileUrl?.absoluteString, loginSource: LoginSource.google.getRawValue())
        
//        let existingUser = UserManager.shared.getCurrentUser()
//        if(existingUser == newUser){
//            print("Same login")
//        }
//        else{
//            print("Different login")
//        }
        self.set(user: newUser)
        delegate?.didLoginSuccessfully()
    }
    
    
    /**
    Logout from Google
    */
    public func performGoogleSignOut(){
        GIDSignIn.sharedInstance()?.signOut()
        GIDSignIn.sharedInstance()?.disconnect()
    }
    
    
    /**
    Login with Google
    */
    public func performGoogleSingIn(controller:UIViewController){
        GIDSignIn.sharedInstance()?.presentingViewController = controller
        GIDSignIn.sharedInstance()?.signIn()
    }
}


// Facebook Login
extension LoginViewModel {
    
    /**
     Login with Facebook
     */
    public func performFaceBookLogin(contoller:UIViewController){
        
        fbLoginManager.logIn(permissions: ["email"], from: contoller) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    let loggedOutUser = self.getLogoutUser()
                    self.set(user: loggedOutUser)
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }
    }
    
    
    /**
    Logout from Facebook
    */
    public func performFacebookLogout(){
        fbLoginManager.logOut()
    }
    
    
    /**
     Get the facebook data
     */
    private func getFBUserData(){
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    let resultDic = result as! NSDictionary
                    print(result ?? (Any).self)
                    let email:String? = resultDic .value(forKey: "email") as? String
                    let id:String? = resultDic .value(forKey: "id") as? String
                    let name:String? = resultDic .value(forKey: "name") as? String
                    let picture:NSDictionary = resultDic .value(forKey: "picture") as! NSDictionary
                    let data:NSDictionary = picture .value(forKey: "data") as! NSDictionary
                    let profileUrl:String? = data .value(forKey: "url") as? String
                    
                    let loggedInUser = User.init(name: name, id: id, emailID: email, profilePhotoUrl: profileUrl, loginSource: LoginSource.facebook.getRawValue())
                    
                    self.set(user:loggedInUser)
                }
                else{
                    let loggedOutUser = self.getLogoutUser()
                    self.set(user: loggedOutUser)
                }
            })
        }
    }
}
