//
//  EditInfoViewController.swift
//  Tinder
//
//  Created by Administrator on 16/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class EditInfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        renderUI()
    }
    @IBAction func didDoneButtonTouch(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func didBackButtonTouch(_ sender: Any) {
        dismiss()
    }
}

private extension EditInfoViewController{
    private func renderUI(){
        //setBackground(view: view)
    }
}
