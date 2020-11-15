//
//  DashboardViewController.swift
//  Tinder
//
//  Created by Administrator on 13/08/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {

    // MARK:- Outlets
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var suggestionButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var nearByFriendButton: UIButton!
    
    @IBOutlet weak var suggestionContainerView: UIView!
    @IBOutlet weak var chatContainerView: UIView!
    @IBOutlet weak var profileContainerView: UIView!
    @IBOutlet weak var nearByFriendsView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var suggestionImageView: UIImageView!
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var nearByFriendsImageView: UIImageView!
    
    
    // MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        renderUI()
        show(container: profileContainerView, icon: profileImageView)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    // MARK:- Button Action
    @IBAction func didProfileButtonTouch(_ sender: Any) {
        show(container: profileContainerView, icon: profileImageView)
    }
    
    @IBAction func didSuggestionButtonTouch(_ sender: Any) {
        show(container: suggestionContainerView, icon: suggestionImageView)
    }
    
    @IBAction func didChatButtonTouch(_ sender: Any) {
        show(container: chatContainerView, icon: chatImageView)
    }
    
    @IBAction func didNearByFriendButtonTouch(_ sender: Any) {
        show(container: nearByFriendsView, icon: nearByFriendsImageView)
    }
}

private extension DashboardViewController{
    
    /**
     Render UI
     */
    private func renderUI() {
        view.setDefaultBackgroundColor()
    }
    
    private func hideAllContainer() {
        suggestionContainerView.isHidden = true
        chatContainerView.isHidden = true
        profileContainerView.isHidden = true
        nearByFriendsView.isHidden = true
        profileImageView.tintColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        suggestionImageView.tintColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        chatImageView.tintColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        nearByFriendsImageView.tintColor = #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
    }
    
    private func show(container:UIView, icon:UIImageView) {
        hideAllContainer()
        container.isHidden = false
        icon.tintColor = #colorLiteral(red: 0.9803921569, green: 0.1960784314, blue: 0.3529411765, alpha: 1)
    }
}
