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
    
    // ViewModel
    var viewModel:SelectGenderViewModel!
    
    
    // MARK:- ViewController Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
     
        prepareView()
        updateView()
    }
    
    
    @IBAction func maleButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func womanButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func otherButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func continueButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func choosePublicGenderOnProfileButtonAction(_ sender: Any) {
    }
    
    @IBAction func skipBarButtonAction(_ sender: Any) {
    }
    
}


extension SelectGenderViewController{
    func updateView() {
        viewModel = SelectGenderViewModel()
    }
}


extension SelectGenderViewController : UIViewControllerPrepareView{
    
    func prepareView() {
        
        addBorder(width: 1.0, color: #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1), views: [manButton,womanButton,otherButton])
    }
}
