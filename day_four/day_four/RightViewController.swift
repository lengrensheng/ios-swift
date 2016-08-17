//
//  LeftViewController.swift
//  day_four
//
//  Created by meizu on 16/8/17.
//  Copyright © 2016年 stokey. All rights reserved.
//

import Foundation
import UIKit

class RightViewController:UIViewController{

    @IBOutlet var rightTitle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}