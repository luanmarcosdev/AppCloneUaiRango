//
//  RegisterViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 15/04/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.setDelegate(delegate: self)
    }

}

extension RegisterViewController: RegisterScreenDelegate {
    
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionLoginButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
