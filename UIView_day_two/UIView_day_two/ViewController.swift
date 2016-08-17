//
//  ViewController.swift
//  UIView_day_two
//
//  Created by meizu on 16/8/1.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameText: UITextField!

    @IBOutlet weak var sexSegment: UISegmentedControl!
    
    @IBOutlet weak var okPadButton: UIButton!
    
    @IBOutlet weak var birthView: UIDatePicker!

    @IBOutlet weak var heigthText: UILabel!
    
    @IBOutlet weak var contentText: UITextView!
    
    @IBOutlet weak var houseSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameText.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        nameText.resignFirstResponder();
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameText.resignFirstResponder();
        return true;
    }


    @IBAction func heigthEvent(sender: AnyObject) {
        let slider = sender as! UISlider;
        let height = Int(slider.value);
        slider.value = Float(height);
        heigthText.text = "\(height)cm";
    }
    
    @IBAction func okPadEvent(sender: AnyObject) {
        nameText.resignFirstResponder();
        let name = nameText.text?.characters.count>0 ? nameText.text! : "无名氏";
        
        let sexText = sexSegment.selectedSegmentIndex == 0 ? "man": "woman";
        let hasHouse = houseSwitch.on ? "有房" : "没房";
        
        let birth =  NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian);
        let now = NSDate();
        
        let components = birth?.components([.Year],fromDate:birthView.date,toDate: now,options:NSCalendarOptions(rawValue: 0));
        let age = components?.year;
        contentText.text = "\(name),\(age!)岁,\(sexText),身高\(heigthText.text!),\(hasHouse),求交往！";
    }
}

