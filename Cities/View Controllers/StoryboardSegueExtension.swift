//
//  StoryboardSegueExtension.swift
//  Cities
//
//  Created by Blake Loizides on 7/30/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController {
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "citiesToCityMapSegue" {
      if let vc = segue.destination as? CityMapViewController {
        vc.city = self.selectedCity
      }
    }
  }
}
