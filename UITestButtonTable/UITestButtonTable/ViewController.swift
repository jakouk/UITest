//
//  ViewController.swift
//  UITestButtonTable
//
//  Created by unbTech on 2017. 4. 21..
//  Copyright © 2017년 unbTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainScroll: UIScrollView!
    
    var firstScroll: UIScrollView!
    var secondScroll: UIScrollView!
    var thirdScroll: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading th
        
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
        
        
        
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 2))
        view1.backgroundColor = UIColor.red
        
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 3))
        view2.backgroundColor = UIColor.green
        
        let view3 = UIView(frame: CGRect(x: 0, y: 0, width: self.mainScroll.frame.size.width, height: self.mainScroll.frame.size.height * 4))
        view3.backgroundColor = UIColor.blue
        
        self.firstScroll.addSubview(view1)
        self.secondScroll.addSubview(view2)
        self.thirdScroll.addSubview(view3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func touchUpInsideCalendarButton(_ sender: UIButton) {
        
        print("calendar");
        
        if ( sender.isSelected  ) {
            
            self.mainScroll.contentOffset = CGPoint(x: 0, y: 0);
            
        } else {
            
            self.mainScroll.contentOffset = CGPoint(x: 0, y: 0);
            
        }
        
    }
    
    @IBAction func touchUpInsideClockButton(_ sender: UIButton) {
        
        print("clock");
        
        if ( sender.isSelected  ) {
            
            self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width, y: 0);
            
        } else {
            
            self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width, y: 0);
            
        }
        
    }

    @IBAction func touchUpInsdieBarGraphButton(_ sender: UIButton) {
        
        print("bar");
        
        if ( sender.isSelected  ) {
            
            self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width*2, y: 0);
            
        } else {
            
            self.mainScroll.contentOffset = CGPoint(x: self.view.frame.width*2, y: 0);
            
        }
        
    }
    

    
    
}

