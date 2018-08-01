//
//  City.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation
import MapKit

struct City: Decodable {
  var id: Int
  var country: String
  var name: String
  var coordinates: CLLocationCoordinate2D

  init(from decoder: Decoder) throws {
    let rawResponse = try RawServerResponse(from: decoder)
    id = Int(rawResponse._id)
    country = rawResponse.country
    name = rawResponse.name
    coordinates = CLLocationCoordinate2D(latitude: rawResponse.coord.lat, longitude: rawResponse.coord.lon)
  }
}

