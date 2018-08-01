//
//  BaseViewController.swift
//  Cities
//
//  Created by Blake Loizides on 7/29/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  internal func setupNavigation(navigationTitle:String) {
    self.navigationItem.title = navigationTitle
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.largeTitleDisplayMode = .always
  }
}
