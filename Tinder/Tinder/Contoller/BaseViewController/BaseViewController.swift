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
        //setBackground(view: view)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }
}

extension BaseViewController{
    /**
     To set the background color
     */
    func setBackground(view:UIView) {
        let colorTop =  UIColor(red: 250.0/255.0, green: 90.0/255.0, blue: 70.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 250.0/255.0, green: 0.0/255.0, blue: 110.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop,colorBottom,colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at:0)
    }
    
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
}
