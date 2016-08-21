//
//  ViewController.swift
//  SwiftWeather
//
//  Created by stokey on 16/8/20.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import CoreLocation
import AFNetworking

class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager:CLLocationManager = CLLocationManager()
    let APPID = "94605a9921d7eda99b17c30c318c65e5"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        if locations.count>0{
            let location:CLLocation = locations[locations.count-1] as CLLocation
            if location.horizontalAccuracy>0{
                updateWeatherInfo(location.coordinate.latitude,longitude: location.coordinate.longitude)
                
                print("locationHorizontalAccuracy:\(location.horizontalAccuracy),latitude:\(location.coordinate.latitude),longitude:\(location.coordinate.longitude)")
            }
            locationManager.stopUpdatingLocation()
        }
    }
    func updateWeatherInfo(latitude:CLLocationDegrees,longitude:CLLocationDegrees){
        let manager = AFHTTPSessionManager()
        let url = "http://api.openweathermap.org/data/2.5/forecast/city"
        //深圳city id:1795565
        let params = ["id":1795565,"APPID":APPID]
        manager.GET(url,
                    parameters: params,
                    progress: {(progress:NSProgress)->Void in print("download progress:\(progress)")},
                    success:{(task:NSURLSessionDataTask,responseObject:AnyObject?)->Void in
                        print("get result:\(responseObject?.description)")} ,
                    failure:{(task:NSURLSessionDataTask?,error:NSError)->Void in print("请求失败:\(error.description)")})
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("location error:\(error.localizedDescription)")
        locationManager.stopUpdatingLocation()
    }

}

