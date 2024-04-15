//
//  LoginViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 08/04/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        loginScreen?.setDelegate(delegate: self)
    }
    
}

extension LoginViewController: LoginScreenDelegate {
    
    func actionLinkLabel() {
        let vc = UseTermsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
