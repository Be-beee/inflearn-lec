//
//  SignUpViewController.swift
//  Lecture_SignIn
//
//  Created by 서보경 on 2020/03/16.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var buttonSignUp: UIButton!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSignUp.layer.cornerRadius = buttonSignUp.bounds.size.height / 2
        buttonSignUp.layer.borderWidth = 1
        buttonSignUp.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func backToSignIn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpApiCall(_ sender: UIButton) {
        
        let params = [ "name" : nameField.text ?? "",
                      "password" : passwordField.text ?? "",
                      "email" : emailField.text ?? ""
        ]
        
        // HTTP Method -> POST
        // query => body
        
        // GET => URL + query
        guard let url = URL(string: "http://localhost:3000/loginUsers") else { return }
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.queryString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data else {
                // alert
                return
            }
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginUser.self, from: data)
                
                User.shared.info = user
                
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            } catch {
                print("Sign up Error \(error)")
            }
            
            
            
        }.resume()
    }
}
