//
//  ViewController.swift
//  day_eight
//
//  Created by meizu on 16/8/23.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var isPlaying = false
    var audioPlayer:AVAudioPlayer?
    var timer:NSTimer?
    
    let gradientLayer = CAGradientLayer()//渐变层
    let bgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playMusic(){
        if !isPlaying {
            do {
                if audioPlayer == nil {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    try AVAudioSession.sharedInstance().setActive(true)
                    try audioPlayer = AVAudioPlayer(contentsOfURL: bgMusic)
                }
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                isPlaying = true
            }
            catch let audioError as NSError {
                print("Error:\(audioError)")
            }
        } else{
            if let player = audioPlayer {
                player.stop()
                isPlaying = false
            }
        }
    }
    
    func changeBgColor(){
        if !isPlaying {
            timer?.invalidate()
            timer = nil
        }else{
            if timer == nil {
                timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(self.randomColor), userInfo: nil,     repeats: true)
            }
        }
    }
    
    func randomColor(){
        let redValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    func changeGradientLayer(){
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0,green: 0,blue: 0,alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0,green: 1,blue: 0,alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0,green: 0,blue: 1,alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        gradientLayer.colors = [color1,color2,color3,color4,color5]
        gradientLayer.locations = [0.10,0.30,0.50,0.70,0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
    }

    @IBAction func playTapped(sender: AnyObject) {
        playMusic()
        changeBgColor()
        changeGradientLayer()
    }
}

