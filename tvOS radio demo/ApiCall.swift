//
//  ApiCall.swift
//  tvOS radio demo
//
//  Created by Andrei Palonski on 12.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation

class ApiCall {
  
  var stations : [Station] = []
  
  func downloadData(vc: ViewController) {
    
    let url = URL(fileURLWithPath: ApiUrl().getUrl())
    let request = URLRequest(url: url)
    let sesseion = URLSession.shared
    
    let task = sesseion.dataTask(with: request as URLRequest) {(data, response, error) -> Void in
      if error != nil {
        print("Error downloading api data")
      } else {
        do {
          if let dictArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Dictionary<String, AnyObject>] {
            for obj in dictArray {
              print("Got object")
              let stat = Station(stationDict: obj)
              self.stations.append(stat)
            }
            DispatchQueue.main.async {
              vc.updateUI(sts: self.stations)
            }
          }
          
        } catch {}
      }
    }
    task.resume()
    
  }
  
}

struct ApiUrl {
  
  private let baseUrl = "http://api.dirble.com/v2/category/11/stations?"
  private let token = "token=65a4fb582f2837c211b8f36ddd"
  private let pagination = "&per_page=30"
  
  func getUrl() -> String {
    return self.baseUrl + self.token + self.pagination
  }
}
