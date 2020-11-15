//
//  PhotoLibraryDelegate.swift
//  Tinder
//
//  Created by Nirbhay Singh on 15/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit
import Foundation
import Photos

class PhotoLibraryDelegate: NSObject {

    private var pickedImage:UIImage?{
        didSet{
            bindPickedImageToController(pickedImage)
        }
    }
    
    var bindPickedImageToController:(_ pickedImage:UIImage?)->Void = {_ in}
    
    override init() {
        
    }
}

extension PhotoLibraryDelegate : UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        pickedImage = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        pickedImage = nil
    }
}

extension PhotoLibraryDelegate : UINavigationControllerDelegate{}

