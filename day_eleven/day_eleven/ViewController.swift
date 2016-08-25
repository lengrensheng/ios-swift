//
//  ViewController.swift
//  day_eleven
//
//  Created by meizu on 16/8/25.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var centerAlginPassword: NSLayoutConstraint!
    
    @IBOutlet weak var disppearButton: UIButton!
 
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    
    var isShowing:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        disppearButton.layer.cornerRadius = 5
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        centerAlignUsername.constant -= self.view.bounds.width
        centerAlginPassword.constant -= self.view.bounds.width
        loginButton.alpha = 0
        disppearButton.alpha = 0
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    func showAnimation(){
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.10, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.centerAlginPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.loginButton.alpha = 1.0
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                if self.disppearButton.alpha != 1.0{
                    self.disppearButton.alpha = 1.0
                }
            }, completion: nil)
        self.disppearButton.setTitle("隐藏", forState: .Normal)
        isShowing = true
    }
    func disappearAnimation() {
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.centerAlignUsername.constant = -self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.10, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.centerAlginPassword.constant = -self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.loginButton.alpha = 0.0
            }, completion: nil)
        
        self.disppearButton.setTitle("显示", forState: .Normal)
        isShowing = false
    }
    
    @IBAction func backTapped(sender: AnyObject) {
        disappearAnimation()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func loginTapped(sender: AnyObject) {
        let bounds = self.loginButton.bounds
        if(self.view.bounds.size.width - bounds.size.width > 90 &&
                bounds.size.height < 65){
            UIView.animateWithDuration(0.6, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.loginButton.bounds = CGRect(x: bounds.origin.x-20, y:bounds.origin.y-10, width: bounds.size.width + 50, height: bounds.size.height+15)
                }, completion: nil)
        }else{
            self.loginButton.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: 80, height: 40)
        }
    }
    @IBAction func disppearButtonTapped(sender: AnyObject) {
        if isShowing{
            disappearAnimation()
        }else{
            showAnimation()
        }
    }
}

