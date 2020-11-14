//
//  ImageDownloadOperation.swift
//  WorldMap
//
//  Created by Administrator on 10/02/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

enum DownloadingState {
    case Initialized
    case InProgress
    case Downloaded
    case Canceled
}

class ImageDownloadOperation: Operation {

    let url:String
    let imageView:UIImageView
    
    
    init(imageView:UIImageView, url:String) {
        self.url = url
        self.imageView = imageView
    }
    
    override func main() {
        
        if isCancelled{
            return
        }
        
        imageView.download(from: url)
    }
    
}
