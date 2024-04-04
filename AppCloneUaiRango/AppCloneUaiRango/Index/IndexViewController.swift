//
//  IndexViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 03/04/24.
//

import UIKit

class IndexViewController: UIViewController {
    
    var indexScreen: IndexScreen?
    
    override func loadView() {
        self.indexScreen = IndexScreen()
        self.view = indexScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.indexScreen?.setDelegate(delegate: self)
    }

}

extension IndexViewController: IndexScreenDelegate {
    func actionCityButton() {
        print("print city view controller")
    }
    
    func actionLoginButton() {
        print("login login view controller")
    }
    
    func actionUserTermsButton() {
        print("useterms clicked")
    }
    
    func actionAboutButton() {
        print("about button clicked")
    }
    
    
}
