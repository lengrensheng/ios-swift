//
//  ViewController.swift
//  day_nine
//
//  Created by meizu on 16/8/24.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    var imageView:UIImageView!
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "Steve"))
        initScrollView()
        scrollView.delegate = self
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    //初始化scrollView
    func initScrollView(){
        if scrollView == nil{
            scrollView = UIScrollView(frame: self.view.bounds)
            scrollView.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
            scrollView.backgroundColor = UIColor.clearColor()
            scrollView.contentSize = imageView.bounds.size
            scrollView.addSubview(imageView)
            self.view.addSubview(scrollView)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func recenterImage(){
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width-imageViewSize.width)/2.0:0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height)/2.0:0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
    
    func setZoomScaleFor(scrollViewSize:CGSize){
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heigthScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heigthScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
    }
}

