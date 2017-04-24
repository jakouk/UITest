//
//  ViewController.swift
//  UITestButtonTable
//
//  Created by unbTech on 2017. 4. 21..
//  Copyright © 2017년 unbTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainScroll: UIScrollView!
    
    // dataScrollView
    var firstScroll: UIScrollView!
    var secondScroll: UIScrollView!
    var thirdScroll: UIScrollView!
    
    // firstScrollData
    var tableFirstView = UITableView()
    //var tableSecondView: UITableView!
    //var tableThirdView: UITableView!
    
    @IBOutlet weak var firstButtonCheckView: UIView!
    @IBOutlet weak var secondButtonCheckView: UIView!
    @IBOutlet weak var thirdButtonCheckView: UIView!
    
    let tableSubjectData = ["식전평균","식전평균","공복","취침전","혈압","맥박","당화혈색소","식사","간식","운동","주입","복용"];
    
    //dayButton
    var firstDayButton = UIButton()
    
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading th
        
        self.mainScroll.delegate = self;
        
        self.mainScroll.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.mainScroll.frame.size.height)
        self.mainScroll.isPagingEnabled = true
        
        self.firstScroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height))
        self.firstScroll.contentSize = CGSize(width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 2);
        
        
        self.secondScroll = UIScrollView(frame: CGRect(x: self.mainScroll.frame.size.width, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height))
        self.secondScroll.contentSize = CGSize(width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 3);
        
        
        self.thirdScroll = UIScrollView(frame: CGRect(x: self.mainScroll.frame.size.width * 2, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height))
        self.thirdScroll.contentSize = CGSize(width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 4);
        
        
        self.mainScroll.addSubview(firstScroll);
        self.mainScroll.addSubview(secondScroll);
        self.mainScroll.addSubview(thirdScroll);
        
        
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 3))
        view2.backgroundColor = UIColor.green
        
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 4))
        view3.backgroundColor = UIColor.blue

        
        
        //day TableView
        self.tableFirstView.delegate = self;
        self.tableFirstView.dataSource = self;
        self.tableFirstView.frame = CGRect(x: 0, y: 44, width: self.firstScroll.frame.size.width, height: 0)
        self.tableFirstView.register(UINib(nibName: "oneDayData", bundle: nil), forCellReuseIdentifier: "cell")
    
        
        
        // dayButton
        
        self.firstDayButton.frame = CGRect(x: 0, y: 0, width: self.firstScroll.frame.size.width, height: 44)
        self.firstDayButton.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
        self.title = "2016년 08월 18일 (금)"
        
        self.firstDayButton.addTarget(self, action: #selector(touchUpInsideDayButtonClick(_:)), for: UIControlEvents.touchUpInside)
        
        
        // add Subview
        
        self.secondScroll.addSubview(view2)
        self.thirdScroll.addSubview(view3)
        
        self.firstScroll.addSubview(self.tableFirstView)
        self.firstScroll.addSubview(self.firstDayButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: touchUpInsideButton
    @IBAction func touchUPInsideButton(_ sender: UIButton) {
        
        if ( sender.tag == 1 ) {
            
            if ( !sender.isSelected  ) {
                
                self.mainScroll.contentOffset = CGPoint(x: 0, y: 0);
                self.firstButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
                self.secondButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                
            }
            
        } else if ( sender.tag == 2 ) {
            
            if ( !sender.isSelected  ) {
                
                self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width, y: 0);
                self.firstButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                self.secondButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
                self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                
            }
            
        } else if ( sender.tag == 3 ) {
            
            if ( !sender.isSelected  ) {
                
                self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width*2, y: 0);
                self.firstButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                self.secondButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
                self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
                
            }
            
        }
        
    }
    
    //MARK: dataButton Click Delegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if ( scrollView.contentOffset.x == 0 ) {
            
            self.firstButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
            self.secondButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            
            
        } else if ( scrollView.contentOffset.x == self.mainScroll.frame.size.width ) {
            
            self.firstButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            self.secondButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
            self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            
        } else if ( scrollView.contentOffset.x == self.mainScroll.frame.size.width * 2 ) {
            
            self.firstButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            self.secondButtonCheckView.backgroundColor = UIColor(red: 0.11, green: 0.82, blue: 0.85, alpha: 1.0);
            self.thirdButtonCheckView.backgroundColor = UIColor(red: 0.45, green: 0.91, blue: 0.90, alpha: 1.0);
            
        }
        
    }
    
    //MARK: tableViewData
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var cellNumber = 0
        
        if ( section == 0 ) {
            cellNumber = 4
        } else if ( section == 1 ) {
            cellNumber = 6
        } else if ( section == 2 ) {
            cellNumber = 2
        }
        
        return cellNumber;
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! oneDayData
        cell.dataLabel.text = "hello"
        
        var sectionNumber = 0
        
        if ( indexPath.section == 0 ) {
            sectionNumber = 0
        } else if ( indexPath.section == 1 ) {
            sectionNumber = 4
        } else if ( indexPath.section == 2 ) {
            sectionNumber = 10
        }
        
        
        cell.subjectLabel.text = self.tableSubjectData[sectionNumber + indexPath.row]
    
        return cell
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
        
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
        
    }
    
    //MARK: dayButton
    
    public func touchUpInsideDayButtonClick ( _ sender: UIButton ) {
        
        if ( !sender.isSelected ) {
            
            self.tableFirstView.frame = CGRect(x: 0, y: 44, width: self.firstScroll.frame.size.width, height: 660)
            sender.isSelected = true
            
            
            
        } else {
            
            self.tableFirstView.frame = CGRect(x: 0, y: 44, width: self.firstScroll.frame.size.width, height: 0)
            sender.isSelected = false
            
        }
        
    }
    
}

