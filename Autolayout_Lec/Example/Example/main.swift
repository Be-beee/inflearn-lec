//
//  main.swift
//  Example
//
//  Created by 서보경 on 2020/04/16.
//  Copyright © 2020 서보경. All rights reserved.
//

import Foundation


func solution(_ number:String, _ k:Int) -> String {
    var answer: [String] = []
    var k = k

    var numbers = number.map{ $0.description }
    var i = 0
    var item = ""
    while i < numbers.count {
        item = numbers[i]
        if k == 0 {
            break
        }
        if let last = answer.last, last < numbers[i] {
            answer.removeLast()
            k -= 1
        } else {
            answer.append(item)
            i += 1
        }
    }
    if i < numbers.count {
        answer.append(contentsOf: numbers[i...numbers.count-1])
    }

    return answer[0...answer.count-k-1].joined()

}
