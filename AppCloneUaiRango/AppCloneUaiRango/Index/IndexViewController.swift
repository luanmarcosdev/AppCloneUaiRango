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
    }
    



}
