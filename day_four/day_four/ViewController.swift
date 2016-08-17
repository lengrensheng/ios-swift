//
//  ViewController.swift
//  day_four
//
//  Created by meizu on 16/8/16.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        initView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initView() {
        let leftViewController:LeftViewController = LeftViewController(nibName: "LeftView", bundle: nil)
        self.addChildViewController(leftViewController)
        if let view = leftViewController.view {
            self.scrollView.addSubview(view)
        }
        leftViewController.didMoveToParentViewController(self)
        
        
        let centerViewController:CenterViewController = CenterViewController(nibName: "CenterView", bundle: nil)
        self.addChildViewController(centerViewController)
        if let view = centerViewController.view {
            self.scrollView.addSubview(view)
        }
        centerViewController.didMoveToParentViewController(self)
        
        //设置显示位置
        var centerViewFrame:CGRect = centerViewController.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerViewController.view.frame = centerViewFrame
        
        let rightViewController:RightViewController = RightViewController(nibName: "RightView", bundle: nil)
        self.addChildViewController(rightViewController)
        if let view = rightViewController.view {
            self.scrollView.addSubview(view)
        }
        rightViewController.didMoveToParentViewController(self)
        
        //设置显示位置
        var rightViewFrame:CGRect = rightViewController.view.frame
        rightViewFrame.origin.x = 2*self.view.frame.width
        rightViewController.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width*3, self.view.frame.height)
    }

}

