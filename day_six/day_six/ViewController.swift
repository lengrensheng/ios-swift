//
//  ViewController.swift
//  day_six
//
//  Created by meizu on 16/8/18.
//  Copyright © 2016年 stokey. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var locationText: UILabel!
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startUpdatingLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        self.locationText.text = error.localizedDescription
        locationManager.stopUpdatingHeading()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks,error)->Void in
            if (error != nil) {
                self.locationText.text = "get a error:\(error?.localizedDescription)"
                print("get a error:\(error)")
                self.locationManager.stopUpdatingLocation()
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            }else{
                self.locationText.text = "Problem with the data received from geocoder"
                print("Problem with the data received from geocoder")
                self.locationManager.stopUpdatingLocation()
            }
        })
    }
    
    func  displayLocationInfo(placemark:CLPlacemark?) {
        if let placemarkInfo = placemark{
            locationManager.stopUpdatingLocation()
            let locality = (placemarkInfo.location != nil) ? placemarkInfo.locality : ""
            
            let postalCode = (placemarkInfo.postalCode != nil) ? placemarkInfo.postalCode : ""
            
            let administrativeArea = (placemarkInfo.administrativeArea != nil) ? placemarkInfo.administrativeArea : ""
            
            let country = (placemarkInfo.country != nil) ? placemarkInfo.country : ""
            self.locationText.text = "locality:\(locality),postalCode:\(postalCode),administrativeArea:\(administrativeArea),counrty:\(country)"
            
            print("locality:\(locality),postalCode:\(postalCode),administrativeArea:\(administrativeArea),counrty:\(country)")
        }
    }
   
    
    @IBAction func findLocation(sender: AnyObject) {
        print("findLocationClick")
        startUpdatingLocation()
    }
}

