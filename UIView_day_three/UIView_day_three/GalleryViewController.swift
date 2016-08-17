//
//  GalleryViewController.swift
//  UIView_day_three
//
//  Created by stokey on 16/8/2.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import Social

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName: String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let name = imageName {
            imageView.image = UIImage(named: name);
            switch name {
            case "fanbingbing":
                navigationItem.title = "范冰冰";
            case "libingbing":
                navigationItem.title = "李冰冰";
            case "wangfei":
                navigationItem.title="王菲";
            case "zhouxun":
                navigationItem.title = "周迅";
            case "korean":
                navigationItem.title = "宋慧乔";
            default:
                navigationItem.title = "宋慧乔";
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(sender: AnyObject) {
        let controller:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter);
        controller.setInitialText("女神画廊");
        controller.addImage(imageView.image);
        self.presentViewController(controller,animated:true,completion:nil);
    }
}