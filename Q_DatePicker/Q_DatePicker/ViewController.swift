//
//  ViewController.swift
//  Q_DatePicker
//
//  Created by 서보경 on 2020/03/10.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let currendDate = Date()
        
        var dateComponent = DateComponents()
        dateComponent.day = 2
        dateComponent.hour = 1
        
        let maxDate = Calendar.current.date(byAdding: dateComponent, to: currendDate)
        
        
        datePicker.minimumDate = currendDate //최솟값은 오늘까지만
        datePicker.maximumDate = maxDate //최댓값은 이틀 뒤 날짜까지만
        
        
        
        
    }

    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let date = df.string(from: sender.date)
        
        
        print(sender.date.timeIntervalSince1970)
    }
    
}

