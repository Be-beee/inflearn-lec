//
//  LoginUser.swift
//  Lecture_SignIn
//
//  Created by 서보경 on 2020/03/19.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

// class 보다는 struct로 구현하는게 좋음 빠르고


// "location": [
//                  { "city": "seoul", "state": "LA" },
//                  { "city": "seoul", "state": "LA" },
//                  { "city": "seoul", "state": "LA" },
//              ]


// singleton: 인스턴스가 한 번 생성되면 계속 유지되서 같은 값을 나오게 하는 형태

class User {
    static let shared = User() // 1 하나의 객체만 다룰 수 있도록
    
    var info = LoginUser()
    private init() { // 2 새로운 인스턴스 생성을 막는다
        
    }
}

struct LoginUser: Codable {
    
    init() {
        name = ""
        password = ""
        email = ""
        id = 0
        locations = [LocationModel]()
    }
    
    struct LocationModel: Codable {
        let city: String
        let state: String
    }
    
    let name: String
    let password: String
    let email: String
    let id: Int
    let locations: [LocationModel]?
}
