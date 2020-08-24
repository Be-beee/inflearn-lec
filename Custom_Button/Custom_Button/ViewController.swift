//
//  ViewController.swift
//  Custom_Button
//
//  Created by 서보경 on 2020/03/09.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myButton: LoadingButton!
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.borderWidth = 1 // 버튼 테두리 지정 (다듬기4)
        
        myButton.setTitleColor(UIColor.red, for: .normal)
    }

    @IBAction func doAciton(_ sender: Any) {
        isLoading.toggle()
        // isLoading = !isLoading
        if isLoading {
            myButton.startLoading()
        } else {
            myButton.stopLoading()
        }
    }
    
}

