//
//  RawServerResponse.swift
//  Cities
//
//  Created by Blake Loizides on 7/30/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation

struct RawServerResponse: Decodable {
  var _id: Int
  var country: String
  var name: String
  var coord: LocationCoordinates
  
  struct LocationCoordinates: Decodable {
    var lat: Double
    var lon: Double
  }
}
