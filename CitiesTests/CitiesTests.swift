//
//  CitiesTests.swift
//  CitiesTests
//
//  Created by Blake Loizdes on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesTests: XCTestCase {
  
  var citiesViewController: CitiesViewController!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //get the storyboard the CitiesViewController under test is inside
    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: "CitiesViewController") as? CitiesViewController else {
      return
    }
    citiesViewController = viewController
    _ = citiesViewController.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testCitiesViewControllerInstantiation() {
    XCTAssertNotNil(citiesViewController)
  }
}
