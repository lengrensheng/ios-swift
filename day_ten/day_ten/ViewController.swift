//
//  ViewController.swift
//  day_ten
//
//  Created by meizu on 16/8/24.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoBackground()
        
        loginButton.layer.cornerRadius = 4
        signButton.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func setupVideoBackground(){
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alawaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        contentURL = url
        view.userInteractionEnabled = true
    }
}

