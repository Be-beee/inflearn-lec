//
//  ViewController.swift
//  Stopwatch_Review
//
//  Created by 서보경 on 2020/03/14.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelMinute: UILabel!
    @IBOutlet var labelSecond: UILabel!
    @IBOutlet var labelMillisecond: UILabel!
    
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    var isStarting = false
    var timer = Timer()
    var startTime = 0.0
    var elapsed = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startStopButton.setTitle("Start", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        
    }
    
    @IBAction func startStop(_ sender: UIButton) {
        isStarting.toggle()
        
        if isStarting {
            // start
            
            startTime = Date().timeIntervalSince1970 - elapsed
            startStopButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        } else {
            // stop
            
            startStopButton.setTitle("Start", for: .normal)
            timer.invalidate()
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        
        elapsed = 0.0
        startTime = Date().timeIntervalSince1970 - elapsed
        
        labelMillisecond.text = "00"
        labelSecond.text = "00"
        labelMinute.text = "00"
    }
    
    @objc func updateCounter() {
        elapsed = Date().timeIntervalSince1970 - startTime
        
        let date = Date(timeIntervalSince1970: elapsed)
        let df = DateFormatter()
        
        df.dateFormat = "mm"
        labelMinute.text = df.string(from: date)
        
        df.dateFormat = "ss"
        labelSecond.text = df.string(from: date)
        
        df.dateFormat = "SS"
        labelMillisecond.text = df.string(from: date)
    }
    

}

