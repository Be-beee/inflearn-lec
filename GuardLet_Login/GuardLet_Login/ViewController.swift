//
//  ViewController.swift
//  GuardLet_Login
//
//  Created by 서보경 on 2020/03/09.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

//guard let login, keyboard

class DetailViewController: UIViewController {
    @IBOutlet var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewWillAppear(animated)
        myTextField.becomeFirstResponder()
//        화면 이동되면 키보드가 자연스럽게 올라오도록
    }
    
    @IBAction func hideKeyboard(_ sender: UIButton) {
//        myTextField.resignFirstResponder()
        myTextField.endEditing(true)
//        버튼을 누르면 키보드가 숨겨짐 (둘 중 하나 쓰면 됨)
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var lblLogin: UILabel!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLogin.text = ""
    }
    
    @IBAction func doneLogin(_ sender: UIButton) {
        guard let id = tfID.text, id.count > 3 else {
            lblLogin.text = "username is Empty"
            return
        }
        
        guard let password = tfPassword.text, password.count > 0 else {
            lblLogin.text = "password is Empty"
            return
        }
        
        if id == "salmon" && password == "1234" {
            lblLogin.text = "Login SUCCESS!!!"
        } else {
            lblLogin.text = "Login FAILED.."
        }
        
    }
    

}

