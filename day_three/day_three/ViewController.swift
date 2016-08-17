//
//  ViewController.swift
//  day_three
//
//  Created by meizu on 16/8/16.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var data = [
        Video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        Video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    var playButtonController = AVPlayerViewController()
    var playView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.screenImage.image = UIImage(named: video.image)
        cell.titleLabel.text = video.title
        cell.srcLabel.text = video.source
        cell.onPlayButtonTapped = {
            print("title:\(video.title),source:\(video.source),section:\(indexPath.section),row:\(indexPath.row)")
            let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
            self.playView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
            self.playButtonController.player = self.playView
            self.presentViewController(self.playButtonController, animated :true){
                self.playButtonController.player?.play()
            }
        }
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count/2
    }

}

