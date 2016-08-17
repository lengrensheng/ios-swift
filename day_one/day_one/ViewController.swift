//
//  ViewController.swift
//  day_one
//
//  Created by meizu on 16/8/10.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timmer = NSTimer()
    var counter = 0.0
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showText() {
        timerText.text = String(format:"%.1f",counter)
    }
    @IBAction func playTapped(sender: AnyObject) {
        if isPlaying {
            return
        }
        
        playButton.enabled = false
        stopButton.enabled = true
        timmer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func pauseTapped(sender: AnyObject) {
        if isPlaying {
            timmer.invalidate()
            isPlaying = false
            playButton.enabled = true
            stopButton.enabled = false
        }
    }
    
    @IBAction func resetTapped(sender: AnyObject) {
        timmer.invalidate()
        isPlaying = false
        counter = 0.0
        showText()
        playButton.enabled = true
        stopButton.enabled = true
    }
    
    func UpdateTimer() {
        counter = counter + 0.1
        showText()
    }
}

