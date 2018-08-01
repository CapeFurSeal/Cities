//
//  SearchResultsControllerExtension.swift
//  Cities
//
//  Created by Blake Loizides on 7/30/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating
  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text, !text.isEmpty {
      self.filter(text: text) { (cities) in
        self.filteredCities = cities
        self.filterring = true
        self.citiesTableView.reloadData()
      }
    } else {
      self.filterring = false
      self.filteredCities.removeAll()
      self.citiesTableView.reloadData()
    }
  }
  
  internal func filter(text:String, completion: @escaping ([City]) -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
      let filteredCities = self.cities.filter { $0.name.lowercased()
        .contains(text.lowercased()) }
        .sorted(by:City.cityCompare, City.countryCompare)
      DispatchQueue.main.async {
        completion(filteredCities)
      }
    }
  }
}
