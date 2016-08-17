//
//  ViewController.swift
//  UIView_day_three
//
//  Created by stokey on 16/8/2.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let imageResources = ["范冰冰","李冰冰","王菲","周迅","宋慧乔"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.dataSource = self;
        pickerView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToGallery" {
            let index = pickerView.selectedRowInComponent(0);
            
            let vc = segue.destinationViewController as! GalleryViewController;
            
            switch index {
            case 0:
                vc.imageName = "fanbingbing";
            case 1:
                vc.imageName = "libingbing";
            case 2:
                vc.imageName = "wangfei";
            case 3:
                vc.imageName = "zhouxun";
            case 4:
                vc.imageName = "korean";
            default:
                vc.imageName = "korean";
            }
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue){
        print("close");
    }
}

