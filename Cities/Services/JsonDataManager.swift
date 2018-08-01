//
//  JsonDataManager.swift
//  Cities
//
//  Created by Blake Loizides on 7/27/18.
//  Copyright © 2018 BCLab. All rights reserved.
//

import Foundation

class JsonDataManager {
  internal func loadJson(completion: @escaping ([City]?) -> (), errorMessage: @escaping (String) -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
      if let url = Bundle.main.url(forResource: "cities", withExtension: "json") {
        do {
          let data = try Data(contentsOf: url)
          do {
            let response = try JSONDecoder().decode(Array<City>.self, from: data)
            completion(response)
          } catch {
            errorMessage(error.localizedDescription)
          }
        } catch {
          errorMessage(error.localizedDescription)
        }
      }
    }
  }
}
