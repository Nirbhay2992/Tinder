//
//  Protocols.swift
//  Tinder
//
//  Created by Nirbhay Singh on 14/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation
import UIKit


/**
 This protocol is to ensure that view must be prepared before gettting presented. It must be adopted by BaseViewController class only
 */
protocol UIViewControllerPrepareView where Self: BaseViewController {
    
    /**
     To setup the initial design of the view, must be called in viewDidLoad method
     */
    func prepareView()
    
    /**
     To add boarder width and color on the given view layer
     */
    func addBorder(width:Float, color:UIColor, views:[UIView])
    
    /**
     Add and reset background color of the view
     */
    func setBackground(color:UIColor, view:UIView)
    func setBackground(color:UIColor, views:[UIView])
    func resetBackgroundColor(color:UIColor, views:[UIView])
}

extension UIViewControllerPrepareView{
    /**
     As every class does not need to add borader to the view
     */
    func addBorder(width:Float, color:UIColor, views:[UIView]){
        
        for view in views{
            view.layer.borderWidth = CGFloat(width)
            view.layer.borderColor = color.cgColor
        }
    }
    
    func setBackground(color:UIColor, views:[UIView]) {
        for view in views{
            setBackground(color: color, view: view)
        }
    }
    
    func setBackground(color:UIColor, view:UIView) {
        view.backgroundColor = color
    }
    
    func resetBackgroundColor(color:UIColor = .clear, views:[UIView]) {
        for view in views{
            setBackground(color: color, view: view)
        }
    }
}


