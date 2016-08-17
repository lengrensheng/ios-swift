//
//  CollectionViewController.swift
//  day_five
//
//  Created by meizu on 16/8/17.
//  Copyright © 2016年 stokey. All rights reserved.
//
import UIKit
let resueIdentifier = "CollectionCell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout{

    @IBOutlet var imageCollectionView: UICollectionView!
    
    var data:[ImageCell] = [
        ImageCell(image: "blue",content: "this pictrue's name is blue"),
        ImageCell(image: "bodyline",content: "this pictrue's name is bodyline"),
        ImageCell(image: "dudu",content: "this pictrue's name is dudu"),
        ImageCell(image: "walk",content: "this pictrue's name is walk"),
        ImageCell(image: "wave",content: "this pictrue's name is wave"),
        ImageCell(image: "hello",content: "this pictrue's name is hello")
    ]
    let sectionsInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    var alertController = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count*2
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(resueIdentifier, forIndexPath: indexPath) as! CollectionCellView
        let imageCell = data[indexPath.row%data.count]
        cell.desTitle.text = imageCell.content
        cell.imageView.image = UIImage(named: imageCell.image)
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionsInsets;
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 260,height: 440)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(delay * Double(NSEC_PER_SEC))),dispatch_get_main_queue(), closure)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        let imageCell = data[indexPath.row%data.count]
        alertController = UIAlertController(title: "Warring", message: "selected item content:\(imageCell.content)", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alertController, animated: true){
            print("show alert")
        }
        delay(2.0){
           self.alertController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
