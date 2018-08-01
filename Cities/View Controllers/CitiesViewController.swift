//
//  CitiesViewController.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import UIKit

class CitiesViewController: BaseViewController {
  
  @IBOutlet internal weak var citiesTableView: UITableView!
  internal var cities: [City] = []
  internal var filteredCities: [City] = []
  internal var selectedCity: City?
  internal var filterring = false
  internal var searchResultsController: UISearchController?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.setupNavigation(navigationTitle: "Cities")
    self.setupTableview()
    self.setupCitiesSearchController()
    self.getJsonData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.hidesSearchBarWhenScrolling = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationItem.hidesSearchBarWhenScrolling = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  fileprivate func setupCitiesSearchController() {
    self.view.backgroundColor = UIColor.white
    self.searchResultsController = UISearchController(searchResultsController: nil)
    self.searchResultsController?.searchResultsUpdater = self
    self.searchResultsController?.dimsBackgroundDuringPresentation = false
    self.navigationItem.searchController = self.searchResultsController
  }
  
  fileprivate func getJsonData() {
    self.startActivityIndicator()
    JsonDataManager().loadJson( completion: { (cities) in
      guard let citiesArray = cities else {
        self.presentAlertController(withTitle: "Error", message: "There were no cities.")
        return
      }
      self.cities = citiesArray.sorted(by:City.cityCompare, City.countryCompare)
      DispatchQueue.main.async {
        self.stopActivityIndicator()
        self.citiesTableView.reloadData()
      }
    }) { (error) in
      self.presentAlertController(withTitle: "Error", message:error)
      self.stopActivityIndicator()
    }
  }
}
