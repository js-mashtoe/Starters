//
//  ViewController.swift
//  ABasic
//
//  Created by jeff on 6/23/18.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  var collectionView: UICollectionView!
  var didSetupConstraints: Bool = false
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 14
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = UIColor.orange
    cell.alpha = 0.2
//    let acc = UIAccessibilityElement(accessibilityContainer: cell.contentView)
//    b.accessibilityLabel = "Whatever it is"
//    b.accessibilityFrame = cell.contentView.frame
//    b.access
//
//    cell.contentView.accessibilityElements = UIAccessibilityCon
//
//    cell.accessibilityIdentifier = "some-AID"
//    cell.isAccessibilityElement = false
    cell.addSubview(t1Button)
    return cell
  }
  
  override func accessibilityElementCount() -> Int {
    return 1
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    layout.itemSize = CGSize(width: 90, height: 120)
    
    collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(ACell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.backgroundColor = UIColor.white
    self.view.addSubview(collectionView)
//    view.setNeedsUpdateConstraints()
  }
  
  func makeButton() -> UIButton {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    button.addTarget(self, action: #selector(press), for: .touchDown )
    

    return button
  }
  
  lazy var t1Button: UIButton! = {
    let vw = UIButton()
    vw.translatesAutoresizingMaskIntoConstraints = false
    vw.addTarget(self, action: #selector(press), for: .touchDown)
    vw.setTitle("T1", for: .normal)
    vw.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.3, alpha: 1.0)
    vw.setTitleColor(UIColor.black, for: UIControlState.normal)
    return vw
  }()
  
  @IBAction func press()  {
    print("pressed")
    
  }
  
  func test1Constraints(){
    
    NSLayoutConstraint(
      item: t1Button,
      attribute: .left,
      relatedBy: .equal,
      toItem: view,
      attribute: .leftMargin,
      multiplier: 1.0,
      constant: 10.0)
      .isActive = true
    
    NSLayoutConstraint(
      item: t1Button,
      attribute: .width,
      relatedBy: .equal,
      toItem: view,
      attribute: .width,
      multiplier: 0.25,
      constant: 0.0)
      .isActive = true
    
    NSLayoutConstraint(
      item: t1Button,
      attribute: .top,
      relatedBy: .equal,
      toItem: view,
      attribute: .bottom,
      multiplier: 1.0,
      constant: 5.0)
      .isActive = true
  }
  
  override func updateViewConstraints() {
    if !didSetupConstraints {
      test1Constraints()
    }
  }

  


}

class ACell: UICollectionViewCell {
  var me: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.me = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
//    self.me.setTitle( "ME" , for: .normal)
    self.me.text = "meB"

    self.me.textAlignment = .center
    self.me.isUserInteractionEnabled = true
    let tap = UITapGestureRecognizer(target: self, action: #selector(Press))

    self.me.addGestureRecognizer(tap)
    contentView.addSubview(self.me)
  }
  
  @IBAction func Press(sender: UITapGestureRecognizer) {
    print("press")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



