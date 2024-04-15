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
        self.view.backgroundColor = .red
    }
    

  

}
