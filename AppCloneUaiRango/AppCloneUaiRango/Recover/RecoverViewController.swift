//
//  RecoverViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 15/04/24.
//

import UIKit

class RecoverViewController: UIViewController {
    
    var recoverScreen: RecoverScreen?
    
    override func loadView() {
        self.recoverScreen = RecoverScreen()
        self.view = recoverScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    

}
