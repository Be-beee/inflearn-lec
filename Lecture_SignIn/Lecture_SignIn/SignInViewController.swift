//
//  SignInViewController.swift
//  Lecture_SignIn
//
//  Created by 서보경 on 2020/03/16.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var buttonSignIn: UIButton!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let loginURLString = "http://localhost:3000/loginUsers"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSignIn.layer.cornerRadius = buttonSignIn.bounds.size.height / 2
        buttonSignIn.layer.borderWidth = 1
        buttonSignIn.layer.borderColor = UIColor.yellow.cgColor
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func moveToSignUp(_ sender: UIButton) {
        let signUpVC = UIStoryboard(name: "SignUpVC", bundle: nil).instantiateViewController(withIdentifier: "signUpVC")
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    
    @IBAction func signInAPICall(_ sender: UIButton) {
        
        // parameters key:value
        // get post
        
        // URLSession
        
        let param = [
            "userName" : userNameTextField.text ?? "",
            "password" : passwordTextField.text ?? ""
        ]
        
        
        // query string url?key=value&key=value
        // http://localhost:3000/loginUsers
        
        // MARK:- Network Modeling
        
//        let loginURL = URL(string: "http://localhost:3000/loginUsers" + "?" + param.queryString)
        
        // URLComponents
        var urlComponents = URLComponents(string: loginURLString)
        urlComponents?.query = param.queryString
        // URL(string: ) 방식과 똑같은데 실수 방지에 좋음
        
        guard let hasURL = urlComponents?.url else {
            return
        }
        
        
        // modeling
        // codable
        URLSession.shared.dataTask(with: hasURL) { (data, response, error) in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            
            do{
                let user = try decoder.decode([LoginUser].self, from: data)
                print("user => \(user)")
                
                if let hasUserInfo = user.first {
                    User.shared.info = hasUserInfo
                    DispatchQueue.main.async { //UI적인 움직임은 메인 스레드에서 작동되어야한다.
                        self.dismiss(animated: true, completion: nil)
                        NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
                    }
                    
                } else {
                    // alert
                    DispatchQueue.main.async { //UI적인 움직임은 메인 스레드에서 작동되어야한다.
                        let alert = UIAlertController.init(title: "유저 정보가 없습니다ㅠㅠ", message: nil, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
                
                
            }catch{
                // error
                print("error ===> \(error)")
            }
            
//            let user = try? decoder.decode(LoginUser.self, from: data)
            
            
        }.resume()

        
    }
    

}


