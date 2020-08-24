//
//  ViewController.swift
//  QuickGuide
//
//  Created by 서보경 on 2020/03/07.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

//DetailView - LifeCycle
//Struct VS Class

struct TestStruct {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    } // 빨리 생성됨, 시간이 빨라서 앵간하면 struct로 구조 짜주는게 좋음
    // 퍼포먼스적으로 유리
    // struct - 값타입, class - 참조타입
    
}

class TestClass {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var structArr: [TestStruct] = []
        var classArr: [TestClass] = []
        
        let startTime = CFAbsoluteTimeGetCurrent()
        for _ in 0 ..< 1000000 {
            structArr.append(TestStruct.init(name: "aa", age: 0))
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime //시간 재기
        
        let startTime2 = CFAbsoluteTimeGetCurrent()
        for _ in 0 ..< 1000000 {
            classArr.append(TestClass.init(name: "aa", age: 0))
        }
        let durationTime2 = CFAbsoluteTimeGetCurrent() - startTime2 //시간 재기
        print("durationTime Class: \(durationTime)")
    }


}

