//
//  ViewController.swift
//  Q_Location
//
//  Created by 서보경 on 2020/03/09.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도
        locationManager.requestWhenInUseAuthorization() // 사용자 허용 alert (appstore reject)
        
        if CLLocationManager.locationServicesEnabled() { // 로케이션 정보 허용시
            locationManager.startUpdatingLocation()
        }
    }
    
    
    // 핵심 부분
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let userLocation = locations.first {
            print("lat \(userLocation.coordinate.latitude)")
            print("lon \(userLocation.coordinate.longitude)")
        }
    }
    // 핵심 부분
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error \(error)")
    }

}

