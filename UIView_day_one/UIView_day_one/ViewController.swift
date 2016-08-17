//
//  ViewController.swift
//  UIView_day_one
//
//  Created by meizu on 16/8/1.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthText: UITextField!
    
    @IBOutlet weak var contentImage: UIImageView!
    let offset = 4;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        birthText.resignFirstResponder();
    }

    @IBAction func okPaddButton(sender: AnyObject) {
        birthText.resignFirstResponder();
        
        if let year  = Int(birthText.text!){
            let imageNumber = (year-offset) % 12;
            contentImage.image = UIImage(named: String(imageNumber));
        }
        
    }
}

