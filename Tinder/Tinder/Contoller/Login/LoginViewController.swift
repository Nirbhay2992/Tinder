//
//  LoginViewController.swift
//  Tinder
//
//  Created by Administrator on 12/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit


class LoginViewController: BaseViewController {
    
    // MARK:- Properties
    // ViewModel
    @IBOutlet weak var viewModel: LoginViewModel!
    
    // MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        renderUI()
    }
    
    
    // MARK:- Button Action
    // Login with Facebook
    @IBAction func didFacebookButtonTouch(_ sender: UIButton) {
        print("didFacebookButtonTouch")
        viewModel.performFaceBookLogin(contoller: self)
    }
    
    // Login with Google
    @IBAction func didGoogleButtonTouch(_ sender: UIButton) {
        print("didGoogleButtonTouch")
        viewModel.performGoogleSingIn(controller: self)
    }
    
    @IBAction func didTroubleButtonTouch(_ sender: UIButton) {
        print("didTroubleButtonTouch")
    }

}


private extension LoginViewController{
    
    /**
     Change the background color
     */
    private func renderUI(){
        view.setDefaultBackgroundColor()
    }
    
    
}


extension LoginViewController : LoginViewModelDelegate{
   
    func didLoginSuccessfully() {
        navigateToViewController(identifier: "\(DashboardViewController.self)")
    }
    
    func didLoginFail() {
        print("didLoginFail")
    }
    
    
}
