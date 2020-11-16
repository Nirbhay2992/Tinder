//
//  SelectGenderViewController.swift
//  Tinder
//
//  Created by Nirbhay Singh on 14/11/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class SelectGenderViewController: BaseViewController {

    // MARK:- Outlet
    @IBOutlet weak var manButton: UIButton!
    @IBOutlet weak var womanButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var genderPreferenceImageView: UIImageView!
    // ViewModel
    var viewModel:SelectGenderViewModel!
    
    
    // MARK:- ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
     
        prepareView()
        dataBindingFromViewModel()
    }
    
    
    @IBAction func maleButtonAction(_ sender: UIButton) {
        viewModel.didGenderChange(selectedGender: .male)
    }
    
    @IBAction func womanButtonAction(_ sender: UIButton) {
        viewModel.didGenderChange(selectedGender: .femail)
    }
    
    @IBAction func otherButtonAction(_ sender: UIButton) {
        viewModel.didGenderChange(selectedGender: .other)
    }
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func choosePublicGenderOnProfileButtonAction(_ sender: Any) {
        viewModel.didGenderPreferenceOnProfileChange()
    }
    
    @IBAction func skipBarButtonAction(_ sender: Any) {
    }
    
    @IBAction func backBarButtonPressed(_ sender: Any) {
        popViewController()
    }
}


private extension SelectGenderViewController{
    
    func dataBindingFromViewModel() {
        viewModel = SelectGenderViewModel()
        
        viewModel.bindSelectGenderViewModelToController = { (gender) in
            self.resetBackgroundColor(views: [self.manButton,self.womanButton,self.otherButton])
            self.update(gender: gender)
        }
        
        viewModel.bindShouldShowGenderOnProfileToController = { shouldShow in
            self.update(genderPreferene: shouldShow)
        }
    }
    
    /**
     Update the button highlight color based on gender choice
     */
    func update(gender:Gender?) {
        
        func changeContinueButtonStatus() {
            switch gender {
            case .none?: continueButton.isEnabled = false
            default:
                continueButton.isEnabled = true
            }
        }
        
        switch gender {
        case .femail: setBackground(color: #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1), view: womanButton)
        case .male : setBackground(color: #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1), view: manButton)
        case .other : setBackground(color: #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1), view: otherButton)
        default:
            resetBackgroundColor(views: [manButton,womanButton,otherButton])
        }
        
        changeContinueButtonStatus()
    }
    
    
    func update(genderPreferene:Bool) {
        let image:UIImage? = (genderPreferene)  ? #imageLiteral(resourceName: "tick.png") : nil
        genderPreferenceImageView.image = image
    }
    
}


extension SelectGenderViewController : UIViewControllerPrepareView{
    
    func prepareView() {
        
        addBorder(width: 1.0, color: #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1), views: [manButton,womanButton,otherButton])
    }
}
