//
//  AlertController.swift
//  Cities
//
//  Created by Blake Loizides on 7/29/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  internal func presentAlertController(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
