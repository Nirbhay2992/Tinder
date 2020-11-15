//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Administrator on 14/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var editInfoButton: UIButton!
    @IBOutlet weak var addMediaButton: UIButton!
    @IBOutlet weak var tinderPlusButton: UIButton!
    
    @IBOutlet weak var collageNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var scrollContainerView: UIView!
    @IBOutlet weak var profileContainerView: UIView!
    
    // View Model
    var viewModel:ProfileViewModel!
    
    // ImagePicker
    private let imagePicker:UIImagePickerController = UIImagePickerController()
    
    private let photoLibraryDelegate:PhotoLibraryDelegate = PhotoLibraryDelegate()
    
    
    // MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        let user = UserManager.shared.getCurrentUser()
        render(user: user)
    }
    
    // MARK:- Button Action
    @IBAction func didEditInfoButtonTouch(_ sender: Any) {
        navigateToViewController(identifier: "\(EditInfoViewController.self)")
    }
    @IBAction func didAddMediaButtonTouch(_ sender: Any) {
        
        imagePicker.delegate = photoLibraryDelegate
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        // Data binding
        photoLibraryDelegate.bindPickedImageToController = { pickedImage in
            // Update the profile image
            if let image = pickedImage {
                self.profileImageView.image = image
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func didSettingButtonTouch(_ sender: Any) {
    }
    
}

extension ProfileViewController : UIViewControllerPrepareView{
    func prepareView() {
        renderUI()
        
    }
}

private extension ProfileViewController {
    /**
     render the UI
     */
    private func renderUI()  {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        profileContainerView.setBottomCorner(radius: 80, backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), borderColor: #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1), borderWidth: 2.0)
        //profileContainerView.addShadow(opacity: 20.0, shadowColor: #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1), radius: 80.0)
    }
    
    
    /**
     Render UI related with User
     */
    private func render(user:User?){
        func getProfileImage(url:String){
            if(url != String()){
                let imageDownloadOperation = ImageDownloadOperation(imageView: profileImageView, url: url)
                imageDownloadOperation.start()
            }
        }
        
        getProfileImage(url: user?.profilePhotoUrl ?? String())
        nameLabel.text = user?.name
        collageNameLabel.text = user?.emailID
    }
    
}
