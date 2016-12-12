//
//  Station.swift
//  tvOS radio demo
//
//  Created by Andrei Palonski on 12.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation


class Station {
  
  var streamUrl = ""
  var stationTitle = ""
  var imageUrlString = ""
  
  init(stationDict: Dictionary<String, AnyObject>) {
    if let strUrl = stationDict["streams"]?[0]["stream"] as? String {
      self.streamUrl = strUrl
    }
    if let title = stationDict["name"] as? String {
      self.stationTitle = title
    }
    if let imgUrl = stationDict["image"]?["url"] as? String {
      self.imageUrlString = imgUrl
    }
  }
  
}
