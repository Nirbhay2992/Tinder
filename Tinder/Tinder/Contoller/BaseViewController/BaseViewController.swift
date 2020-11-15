//
//  BaseViewController.swift
//  Tinder
//
//  Created by Administrator on 12/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}

extension BaseViewController{
    
    /**
     To navigate to the specified view controller
     */
    func navigateToViewController(identifier:String, animation:Bool = true) {
        let storyboard = UIStoryboard(name: StoryboardIdentifier.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:identifier)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: animation)
    }
    
    /**
     Dismiss the controller
     */
    func dismiss(animated:Bool = true){
        dismiss(animated: animated, completion: nil)
    }
    
    /**
     Pop view controller
     */
    func popViewController(animated:Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
}
