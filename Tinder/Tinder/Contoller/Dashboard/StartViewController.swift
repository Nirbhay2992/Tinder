//
//  StartViewController.swift
//  Tinder
//
//  Created by Administrator on 13/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {

    // MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserManager.shared.isSessionExpired(){
             performSegue(withIdentifier: Segue.segueToLoginFromStart, sender: nil)
        }
        else{
             performSegue(withIdentifier: Segue.segueToDashboardFromStart, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        func navigateToScreen(){
            let controller = segue.destination
            controller.modalPresentationStyle = .fullScreen
        }
        
        switch segue.identifier {
        case Segue.segueToLoginFromStart:navigateToScreen()
        case Segue.segueToDashboardFromStart:navigateToScreen()
        case .none: break
        case .some(_):break
        }
    }
}
