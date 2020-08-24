//
//  ViewController.swift
//  Q_Delegate_Pattern
//
//  Created by 서보경 on 2020/03/10.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit


// Delegate Pattern
// protocol

protocol Pname {
    func test()
    var myScore: Int { get }
}

class ViewController: UIViewController, LoginInfo {
    
    
    @IBOutlet var lblMessage: UILabel!
    
    func load(id: String) {
        // 필요한 내용으로 구현
        lblMessage.text = id
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToLoginVC" {
            let loginVC = segue.destination as! LoginViewController
            loginVC.delegate = self //LoginViewController의 LoginInfo를 연결하겠다
            
        }
    }


}

