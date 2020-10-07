//
//  ViewController.swift
//  SafariVC
//
//  Created by 서보경 on 2020/03/09.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit
import SafariServices


// Safari Web View
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: UIButton) {
        let vc = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
        self.show(vc, sender: self)
    }
    
}

