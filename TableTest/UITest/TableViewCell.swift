//
//  CollectionViewCell.swift
//  UITest
//
//  Created by jakouk on 2018. 6. 7..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  var collectionView: UICollectionView!
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = UICollectionViewScrollDirection.horizontal
    collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    collectionView.backgroundColor = UIColor.clear
    
    self.addSubview(collectionView)
    
    collectionView.snp.makeConstraints { make in
      make.top.leading.right.bottom.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func configure() {
    
  }
}

extension TableViewCell: UICollectionViewDataSource {
  // MARK: UICollectionViewDataSource
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath)
    if indexPath.row%2 == 0 {
      cell.backgroundColor = UIColor.red
    } else {
      cell.backgroundColor = UIColor.yellow
    }
    return cell
  }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    print("UICollectionViewDelegate")
    return CGSize(width: 100, height: 100)
  }
}
