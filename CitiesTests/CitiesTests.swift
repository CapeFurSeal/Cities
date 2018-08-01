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
  
  func testCitiesViewControllerHasSearchController() {
    XCTAssertNotNil(citiesViewController.searchResultsController)
  }
  
  func testThatCityFilterIsOrderedInAlphabeticalOrder() {
    let expectations = expectation(description: "Cities json service file does to fullfil")
    JsonDataManager().loadJson( completion: { (cities) in
      XCTAssertNotNil(cities)
      self.citiesViewController.filter(text: "Southwo") { (cities) in
        XCTAssertNotNil(cities)
        XCTAssertEqual(cities.count, 3)
        XCTAssertEqual(cities[0].name, "Southwold")
        XCTAssertEqual(cities[1].name, "Southwood Acres")
        XCTAssertEqual(cities[2].name, "Southworth")
        expectations.fulfill()
      }
    }) { (error) in
      XCTAssertThrowsError(error)
      XCTAssertNotNil(error)
    }
    waitForExpectations(timeout: 30) { error in
      if let error = error {
        XCTFail("waitForExpectationsWithTimeout errored: \(error)")
      }
    }
  }
}
