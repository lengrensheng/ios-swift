//
//  ViewController.swift
//  day_two
//
//  Created by meizu on 16/8/12.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    var data = ["Welcome to React Native! ","The instructions are a bit different depending on your development operating system, and whether you want to start developing for iOS or Android.","You will need Xcode, node.js, the React Native command line tools, and Watchman.","Use the React Native command line tools to generate a new React Native project called \"AwesomeProject\", then run react-native run-ios inside the newly created folder."]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular","Gaspar Regular","BradleyHandITCTT-Bold","PingFangHK-Light"]
    var fontIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fontTableView.dataSource = self
        fontTableView.delegate = self
        for family in UIFont.familyNames(){
            for font in UIFont.fontNamesForFamilyName(family) {
                print("font name:\(font)")
            }
        }
        changeFontButton.layer.cornerRadius = 35
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath);
        let text = data[indexPath.row]
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = text
        cell.textLabel?.backgroundColor = UIColor.blackColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.textLabel?.numberOfLines = 4
        
        cell.textLabel?.font = UIFont(name: self.fontNames[fontIndex], size: 20)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    @IBAction func changeTapped(sender: AnyObject) {
        fontIndex = (fontIndex + 1 ) % 6
        print("fontIndex:\(fontIndex)")
        fontTableView.reloadData()
    }

}

