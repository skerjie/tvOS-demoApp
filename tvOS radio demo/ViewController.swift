//
//  ViewController.swift
//  tvOS radio demo
//
//  Created by Andrei Palonski on 10.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "radioCollectionViewCell", for: indexPath) as? RadioCollectionViewCell {
      cell.updateCell()
      
      if (cell.gestureRecognizers?.count == nil) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.cellTapped(gest: <#T##UITapGestureRecognizer#>)))
        tap.allowedPressType = [NSNumber(value: UIPressType.select.rawValue)]
        cell.addGestureRecognizer(tap)
      }
      
      return cell
    } else {
      return RadioCollectionViewCell()
    }
  }
  
  func cellTapped(gest: UITapGestureRecognizer) {
    if let cell = gest.view as? RadioCollectionViewCell {
      print("Tapped")
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 340, height: 590)
  }
  
  // метод прерраспределяющий фокус ячейки до той, что в данный момент в фокусе и следуещей за той, что в фокусе
  override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    let prevView = context.previouslyFocusedView as? RadioCollectionViewCell
    let nextView = context.nextFocusedView as? RadioCollectionViewCell
  }


}

