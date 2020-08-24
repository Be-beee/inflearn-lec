//
//  LoginViewController.swift
//  Q_Delegate_Pattern
//
//  Created by 서보경 on 2020/03/10.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

protocol LoginInfo {
    func load(id: String)
}

class LoginViewController: UIViewController {
    
    var delegate: LoginInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        delegate?.load(id: sender.text ?? "") // 구현되어있지 않으면 nil 상태
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
