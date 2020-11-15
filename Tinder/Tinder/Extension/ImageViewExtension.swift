//
//  ImageViewExtension.swift
//  Tinder
//
//  Created by Administrator on 15/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation
import UIKit

var imageCache = NSCache<NSString,UIImage>()

extension UIImageView {

    //MARK:- Spinner
    var spinner:UIActivityIndicatorView {
        
        if #available(iOS 13.0, *) {
            return UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            return UIActivityIndicatorView(style: .whiteLarge)
        }
    }
    
    /**
     Start Spinner
     */
    private func startSpinning(){
        spinner.center = self.center
        spinner.startAnimating()
        self.insertSubview(spinner, at: 0)
    }
    
    /**
     Stop Spinner
     */
    private func stopSpinning(){
        spinner.stopAnimating()
        spinner.removeFromSuperview()
    }
    
    /**
     To download the image fomr the given url
     */
    private func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        
        // check for cache
        if let cacheImage = imageCache.object(forKey: url.absoluteString as String as NSString){
                self.image = cacheImage
                return
        }
       
        DispatchQueue.main.async() {
            self.startSpinning()
        }
        
        // download image only if image is not cached
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
             DispatchQueue.main.async() {
                imageCache .setObject(image, forKey: url.absoluteString as String as NSString)
                self.image = image
                self.stopSpinning()
            }
        }.resume()
    }
   
    
    public func download(from link: String, contentMode mode: UIView.ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode)
    }
}
