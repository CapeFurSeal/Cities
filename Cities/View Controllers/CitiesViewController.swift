//
//  CitiesViewController.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import UIKit

class CitiesViewController: BaseViewController {
  
  fileprivate var filtered = [String]()
  fileprivate var filterring = false
  
  lazy var countries: [String] = {
    var names = [String]()
    let current = NSLocale(localeIdentifier: "en_US")
    for code in NSLocale.isoCountryCodes {
      let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
      let name = current.displayName(forKey: NSLocale.Key.identifier, value: id)
      if let country = name {
        names.append(country)
      }
    }
    return names
  }()
  
  lazy var table: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  var tableConstraints: [NSLayoutConstraint]  {
    var constraints = [NSLayoutConstraint]()
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .left, relatedBy: .equal,
                                          toItem: self.view, attribute: .left, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .right, relatedBy: .equal,
                                          toItem: self.view, attribute: .right, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .top, relatedBy: .equal,
                                          toItem: self.view, attribute: .top, multiplier: 1.0, constant: 1.0))
    constraints.append(NSLayoutConstraint(item: self.table, attribute: .bottom, relatedBy: .equal,
                                          toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 1.0))
    return constraints
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.hidesSearchBarWhenScrolling = false
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationItem.hidesSearchBarWhenScrolling = true
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white
    self.setupNavigation(navigationTitle: "Cities")
    self.navigationController?.navigationBar.prefersLargeTitles = true
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    self.navigationItem.searchController = search
    self.view.addSubview(table)
    NSLayoutConstraint.activate(tableConstraints)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension CitiesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.filterring ? self.filtered.count : countries.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = self.filterring ? self.filtered[indexPath.row] : self.countries[indexPath.row]
    return cell
  }
}

extension CitiesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.navigationItem.searchController?.isActive = true
    
  }
}

extension CitiesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    if let text = searchController.searchBar.text, !text.isEmpty {
      self.filtered = self.countries.filter({ (country) -> Bool in
        return country.lowercased().contains(text.lowercased())
      })
      self.filterring = true
    }
    else {
      self.filterring = false
      self.filtered = [String]()
    }
    self.table.reloadData()
  }
}
