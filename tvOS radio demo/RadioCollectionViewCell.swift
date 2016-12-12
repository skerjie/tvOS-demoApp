//
//  RadioCollectionViewCell.swift
//  tvOS radio demo
//
//  Created by Andrei Palonski on 10.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class RadioCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleNameLabel: UILabel!
  
  func updateCell(station: Station) {
    titleNameLabel.text = station.stationTitle
    let url = URL(fileURLWithPath: station.imageUrlString)
    
    DispatchQueue.global().async {
      do {
        let data = try Data(contentsOf: url)
        DispatchQueue.main.async {
          let img = UIImage(data: data)
          self.imageView.image = img
        }
      } catch {}
    }
  }
}
