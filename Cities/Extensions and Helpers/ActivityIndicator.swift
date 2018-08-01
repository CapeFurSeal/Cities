//
//  ActivityIndicator.swift
//  Cities
//
//  Created by Blake Loizdes on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  internal var activityIndicatorTag: Int { return 999999 }
}

extension UIViewController {
  internal func startActivityIndicator(style: UIActivityIndicatorViewStyle = .whiteLarge, location: CGPoint? = nil) {
    let loc = location ?? self.view.center
    DispatchQueue.main.async {
      //Create the activity indicator
      let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: style)
      //Add the tag so we can find the view in order to remove it later
      activityIndicator.tag = self.activityIndicatorTag
      activityIndicator.color = UIColor.black
      //Set the location
      activityIndicator.center = loc
      activityIndicator.tintColor = UIColor.blue
      activityIndicator.hidesWhenStopped = true
      //Start animating and add the view
      activityIndicator.startAnimating()
      self.view.addSubview(activityIndicator)
    }
  }
  
  internal func stopActivityIndicator() {
    //Again, we need to ensure the UI is updated from the main thread!
    DispatchQueue.main.async {
      //Here we find the `UIActivityIndicatorView` and remove it from the view
      if let activityIndicator = self.view.subviews.filter({
        $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
      }
    }
  }
}
