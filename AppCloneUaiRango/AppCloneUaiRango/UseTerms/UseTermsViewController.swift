//
//  UseTermsViewController.swift
//  AppCloneUaiRango
//
//  Created by Luan Arruda on 04/04/24.
//

import UIKit

class UseTermsViewController: UIViewController {
    
    var useTermsScreen: UseTermsScreen?
    
    override func loadView() {
        self.useTermsScreen = UseTermsScreen()
        self.view = useTermsScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
