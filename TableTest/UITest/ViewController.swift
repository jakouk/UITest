//
//  ViewController.swift
//  UITest
//
//  Created by jakouk on 2018. 6. 7..
//  Copyright © 2018년 jakouk. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    self.view.addSubview(tableView)
    
    setupConstraint()
    setupUI()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

extension ViewController {
  func setupUI() {
    tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCell")
  }
  
  func setupConstraint() {
    tableView.snp.makeConstraints { make in
      make.top.leading.right.bottom.equalToSuperview()
    }
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 3 {
      let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
      cell.backgroundColor = UIColor.groupTableViewBackground
      cell.configure()
      return cell
      
    } else {
      let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath as IndexPath) as! UITableViewCell
      cell.textLabel?.text = "cell: \(indexPath.row)"
      return cell
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 3 {
      return 100
    } else {
      return UITableViewAutomaticDimension
    }
    
    
  }
}


