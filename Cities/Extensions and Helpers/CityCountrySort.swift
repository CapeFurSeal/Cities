//
//  CityCountrySort.swift
//  Cities
//
//  Created by Blake Loizides on 7/29/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation

extension Sequence {
  typealias ClosureCompare = (Iterator.Element, Iterator.Element) -> ComparisonResult
  func sorted(by comparisons: ClosureCompare...) -> [Iterator.Element] {
    return self.sorted { object, objectToCompare in
      for comparison in comparisons {
        let comparisonResult = comparison(object, objectToCompare)
        guard comparisonResult == .orderedSame
          else { return comparisonResult == .orderedAscending }
      }
      return false
    }
  }
}

extension City {
  static func cityCompare(city: City, cityToCompare: City) -> ComparisonResult {
    return city.name.compare(cityToCompare.name)
  }
  static func countryCompare(country: City, countryToCompare: City) -> ComparisonResult {
    return country.country.compare(countryToCompare.country)
  }
}
