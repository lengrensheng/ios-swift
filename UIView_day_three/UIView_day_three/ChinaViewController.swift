//
//  ChinaViewController.swift
//  UIView_day_three
//
//  Created by stokey on 16/8/2.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import Social

class ChinaViewController: UIViewController {
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookTapped(sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook);
            controller.setInitialText("女神画廊");
            controller.addImage(contentImageView.image);
            self.presentViewController(controller,animated:true,completion:nil);
    }
    @IBAction func twitterTapped(sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter);
        controller.setInitialText("女神画廊");
        controller.addImage(contentImageView.image);
        self.presentViewController(controller,animated:true,completion:nil);
    }
    @IBAction func weiboTapped(sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeSinaWeibo);
        controller.setInitialText("女神画廊");
        controller.addImage(contentImageView.image);
        self.presentViewController(controller,animated:true,completion:nil);
    }
}