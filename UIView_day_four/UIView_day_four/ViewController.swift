//
//  ViewController.swift
//  UIView_day_four
//
//  Created by stokey on 16/8/4.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
var todos:[TodoModel] = []
var filteredTodos:[TodoModel] = []

class ViewController: UIViewController ,UITableViewDataSource,
    UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController:nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todos = [TodoModel(id: "1", image: "child-selected", title: "1. 去游乐场", date: dateFromString("2014-10-20")!),
                 TodoModel(id: "2", image: "shopping-cart-selected", title: "2. 购物", date: dateFromString("2014-10-28")!),
                 TodoModel(id: "3", image: "phone-selected", title: "3. 打电话", date: dateFromString("2014-10-30")!),
                 TodoModel(id: "4", image: "travel-selected", title: "4. Travel to Europe", date: dateFromString("2014-10-31")!)]
        navigationItem.leftBarButtonItem = editButtonItem()//显示navigationbar 左侧按钮为编辑按钮
        
        //隐藏搜索框
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "搜索Todo"
        
        var contentOffset = tableView.contentOffset
        contentOffset.y += searchController.searchBar.frame.size.height
        tableView.contentOffset = contentOffset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if self.searchController.active {
            return filteredTodos.count
        } else {
            return todos.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell")! as UITableViewCell
        var todo:TodoModel
        if self.searchController.active {
            todo = filteredTodos[indexPath.row]
        } else{
            todo = todos[indexPath.row] as TodoModel
        }
        let image = cell.viewWithTag(101) as! UIImageView
        let title = cell.viewWithTag(102) as! UILabel
        
        let date = cell.viewWithTag(103) as! UILabel
        image.image = UIImage(named: todo.image)
        title.text = todo.title
        let locale = NSLocale.currentLocale()
        let dateFormat = NSDateFormatter.dateFormatFromTemplate("yyyy-MM-dd", options: 0, locale: locale)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        date.text = dateFormatter.stringFromDate(todo.date)
        return cell
    }

    //MARK－UITableViewDelegate  Delete item
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todos.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            self.tableView.reloadData()
        }
    }
    //Edit Mode
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    
    @IBAction func close(segue:UIStoryboardSegue){
        tableView.reloadData();
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "EditTodo"{
            let vc = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let index = indexPath {
                tableView.deselectRowAtIndexPath(indexPath!, animated: false)
                if searchController.active && searchController.searchBar.text != "" {
                    vc.todo = filteredTodos[index.row] as TodoModel
                } else{
                    vc.todo = todos[index.row] as TodoModel
                }
            }
        }
    }
    
    //Move cell
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return editing
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath){
        let todo =  todos.removeAtIndex(sourceIndexPath.row)
        todos.insert(todo, atIndex: destinationIndexPath.row)
    }
    
    //Search Mode
    func filterContentForSearchText(searchText:String,scope:String = "All"){
        filteredTodos = todos.filter({ (todo:TodoModel) -> Bool in
            let stringMatch = todo.title.rangeOfString(searchText)
            return stringMatch != nil
        });
        tableView.reloadData()
    }
    
    //Change Search item height
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
}
extension ViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

