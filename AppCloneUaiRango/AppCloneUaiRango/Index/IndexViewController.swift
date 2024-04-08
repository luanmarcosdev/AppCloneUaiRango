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
        self.navigationController?.isNavigationBarHidden = true
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
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionUserTermsButton() {
        let vc = UseTermsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionAboutButton() {
        let vc = AboutViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
