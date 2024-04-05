//
//  AboutViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 05/04/24.
//

import UIKit

class AboutViewController: UIViewController {

    var aboutScreen: AboutScreen?
    
    override func loadView() {
        self.aboutScreen = AboutScreen()
        self.view = aboutScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.aboutScreen?.setDelegate(delegate: self)
    }
    
}

extension AboutViewController: AboutDelegate {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
