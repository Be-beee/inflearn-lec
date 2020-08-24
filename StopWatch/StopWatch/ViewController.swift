//
//  ViewController.swift
//  StopWatch
//
//  Created by 서보경 on 2020/03/12.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelMillisecond: UILabel!
    @IBOutlet var labelSecond: UILabel!
    @IBOutlet var labelMinute: UILabel!
    
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    var isStarting = false
    var startTime = 0.0
    var elapsed = 0.0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startStopButton.setTitle("Start", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        resetDateLabel()
    }
    
    @IBAction func startStop(_ sender: UIButton) {
        // logic 작성
        if isStarting {
            // stop
            
            
            startStopButton.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            // start
            startTime = Date().timeIntervalSince1970 - elapsed
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            startStopButton.setTitle("Stop", for: .normal)
        }
        
        isStarting.toggle()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        elapsed = 0.0
        startTime = Date().timeIntervalSince1970 - elapsed
        resetDateLabel()
    }
    
    func resetDateLabel() {
        labelMinute.text = "00"
        labelSecond.text = "00"
        labelMillisecond.text = "00"
    }
    
    @objc func updateCounter() {
        
        elapsed = Date().timeIntervalSince1970 - startTime
        
        let date = Date(timeIntervalSince1970: elapsed)
        let df = DateFormatter()
        
        df.dateFormat = "SS"
        labelMillisecond.text = df.string(from: date)
        
        df.dateFormat = "ss"
        labelSecond.text = df.string(from: date)
        
        df.dateFormat = "mm"
        labelMinute.text = df.string(from: date)
    }

}

