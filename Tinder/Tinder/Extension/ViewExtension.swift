//
//  ViewExtension.swift
//  Tinder
//
//  Created by Administrator on 14/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    /**
     To set the background color
     */
    func setDefaultBackgroundColor() {
        self.backgroundColor = UIColor.mainBackgroundColor
    }
    
    /**
     To set the bottom corner radius
     */
    func setBottomCorner(radius:Int,backgroundColor:UIColor, borderColor:UIColor, borderWidth:CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.backgroundColor = backgroundColor
        //self.layer.borderColor = borderColor.cgColor
        //self.layer.borderWidth = borderWidth
    }
    
    
    /**
     To add the shadow offset
     */
    func addShadow(opacity:Float, shadowColor:UIColor, radius:CGFloat)  {

        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: self.frame.size.height/3)
        self.layer.shadowRadius = radius

        self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = 2
    }
    
    func setGradientBorderWidthColor()
    {
        let gradientColor = CAGradientLayer()
        gradientColor.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradientColor.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]

        let pathWithRadius = UIBezierPath(roundedRect:self.bounds, byRoundingCorners:[.topRight, .topLeft, .bottomLeft , .bottomRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        let shape = CAShapeLayer()
        shape.lineWidth = 3
        shape.path = pathWithRadius.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradientColor.mask = shape
        self.layer.mask = shape
        self.layer.addSublayer(gradientColor)
    }

    func addGradientLayer(with colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint, locations: [NSNumber] = [0.0, 1.0], frame: CGRect = CGRect.zero) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = colors

           gradientLayer.startPoint = startPoint
           gradientLayer.endPoint = endPoint

           gradientLayer.locations = locations
           gradientLayer.frame = frame

        gradientLayer.cornerRadius = CALayer.self().cornerRadius
        CALayer.self().insertSublayer(gradientLayer, at: 0)
       }
}



extension CALayer {

  func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

    let border = CALayer()

    switch edge {
    case UIRectEdge.top:
        border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)

    case UIRectEdge.bottom:
        border.frame = CGRect(x:0, y: frame.height - thickness, width: frame.width, height:thickness)

    case UIRectEdge.left:
        border.frame = CGRect(x:0, y:0, width: thickness, height: frame.height)

    case UIRectEdge.right:
        border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)

    default: do {}
    }

    border.backgroundColor = color.cgColor

    addSublayer(border)
 }
    
    
}
// https://stackoverflow.com/questions/49878293/how-to-add-rounded-corners-to-a-uiview-with-gradient-applied
