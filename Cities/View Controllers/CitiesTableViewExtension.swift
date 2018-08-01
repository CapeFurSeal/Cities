//
//  CitiesTableViewExtension.swift
//  Cities
//
//  Created by Blake Loizides on 7/30/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController: UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Tableview delegate Methods
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.filterring ? self.filteredCities.count : cities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier:"CitiesTableViewCell", for: indexPath)
      as? CitiesTableViewCell {
      cell.selectionStyle = UITableViewCellSelectionStyle.none
      cell.cityNameLabel.text = self.filterring ?
        "\(self.filteredCities[indexPath.row].name), \(self.filteredCities[indexPath.row].country)"
        : "\(self.cities[indexPath.row].name), \(self.cities[indexPath.row].country) "
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let searchResultsController = searchResultsController else {
      return
    }
    if searchResultsController.isActive && self.filteredCities.count != 0 {
      self.selectedCity = self.filteredCities[indexPath.row]
    } else {
      self.selectedCity = self.cities[indexPath.row]
    }
    self.navigationItem.searchController?.isActive = false
    self.performSegue(withIdentifier:"citiesToCityMapSegue", sender: self)
  }
  
  internal func setupTableview() {
    UITableView.setupAppTableview(tableview: self.citiesTableView,
                                  delegate: self,
                                  dataSource: self,
                                  backGroundColor: UIColor.clear ,
                                  allowsMultipleSelection: false,
                                  contentInset:UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0))
  }
}
