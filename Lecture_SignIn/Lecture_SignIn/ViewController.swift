//
//  ViewController.swift
//  Lecture_SignIn
//
//  Created by 서보경 on 2020/03/16.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var userInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(infoReLoad), name: NSNotification.Name.init("UserInfoLoad"), object: nil)
    }

    @objc func infoReLoad() {
        DispatchQueue.main.async {
            self.userInfoLabel.text = User.shared.info.email

        }
    }
    
    @IBAction func moveToSignIn(_ sender: UIButton) {
        let signInVC = UIStoryboard(name: "SignInVC", bundle: nil).instantiateViewController(withIdentifier: "naviSignIn")
        self.present(signInVC, animated: true, completion: nil)
        
    }
    
}

