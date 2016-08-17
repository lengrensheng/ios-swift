//
//  DetailViewController.swift
//  UIView_day_four
//
//  Created by stokey on 16/8/5.
//  Copyright © 2016年 stokey. All rights reserved.
//
//
//  ViewController.swift
//  UIView_day_four
//
//  Created by stokey on 16/8/4.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate{
 
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var contentText: UITextField!
    
    @IBOutlet weak var dateViewPicker: UIDatePicker!
    
    var todo:TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentText.delegate = self
        print("data:\(todo?.toString())");
        if todo == nil{
            childButton.selected = true
            navigationItem.title = "新增Todo"
        }else{
            navigationItem.title = "修改Todo"
 
            if todo?.image == "child-selected"{
                childButton.selected = true
            } else if todo?.image == "phone-selected"{
                phoneButton.selected = true
            } else if todo?.image == "shopping-cart-selected"{
                shoppingButton.selected = true
            } else if todo?.image == "travel-selected"{
                travelButton.selected = true
            }
            contentText.text = todo?.title
            dateViewPicker.setDate((todo?.date)!, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshButton() {
        childButton.selected = false
        phoneButton.selected = false
        shoppingButton.selected = false
        travelButton.selected = false
    }
    
    @IBAction func childTapped(sender: AnyObject) {
        refreshButton()
        childButton.selected = true
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        refreshButton()
        phoneButton.selected = true
    }
    @IBAction func shoppingTapped(sender: AnyObject) {
        refreshButton()
        shoppingButton.selected = true
    }
    @IBAction func travelTapped(sender: AnyObject) {
        refreshButton()
        travelButton.selected = true
    }
    
    
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        if childButton.selected {
            image = "child-selected"
        }else if phoneButton.selected {
            image = "phone-selected"
        }else if shoppingButton.selected{
            image = "shopping-cart-selected"
        }else if travelButton.selected {
            image = "travel-selected"
        }
        if todo == nil {
            let uuid = NSUUID.init().UUIDString
            todo = TodoModel(id: uuid, image: image, title: contentText.text!, date:dateViewPicker.date)
            todos.append(todo!)
        } else{
            todo?.image = image
            todo?.title = contentText.text!
            todo?.date = dateViewPicker.date
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        contentText.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        contentText.resignFirstResponder()
    }
}

