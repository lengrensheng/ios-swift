//
//  ViewController.swift
//  day_seven
//
//  Created by meizu on 16/8/18.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let cellIdentifier = "NewCellIdentifier"
    var tableViewController = UITableViewController()
    var refreshController =  UIRefreshControl()
    var navBar = UINavigationBar()
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //NavigationBar
        self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        let navItem = UINavigationItem(title: "day_six")
        self.navBar.setItems([navItem], animated: true)
        
        //TableView
        emojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        emojiTableView.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.016, alpha: 1)
        emojiTableView.delegate = self
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        emojiTableView.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height-64)
        
        //RefreshView
        tableViewController.refreshControl = self.refreshController
        self.refreshController.addTarget(self, action:#selector(ViewController.loadData), forControlEvents: .ValueChanged)
        self.refreshController.backgroundColor = UIColor(red: 0.113, green: 0.133, blue: 0.145, alpha: 1)
        let attributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        self.refreshController.attributedTitle = NSAttributedString(string: "Last updated on \(self.dateToString(nil))", attributes: attributes)
        self.refreshController.tintColor = UIColor.whiteColor()
        
       self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emojiData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        let cellContent = self.emojiData[indexPath.row]
        
        let alterViewController = UIAlertController(title: "Click Item", message: "Click item content:\(cellContent)", preferredStyle: .Alert)
        let cancleAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alterViewController.addAction(cancleAction)
        self.presentViewController(alterViewController, animated:true,completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func loadData() {
        self.emojiData += newFavoriteEmoji
        self.tableViewController.tableView.reloadData()
        self.refreshController.endRefreshing()
    }
    
    func dateToString(date:NSDate?)->String{
        var resultDate: NSDate
        if let newDate = date {
            resultDate = newDate;
        }else{
            resultDate = NSDate()
        }
        let formate = NSDateFormatter()
        formate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formate.locale = NSLocale.currentLocale()
        return formate.stringFromDate(resultDate)
    }
}

