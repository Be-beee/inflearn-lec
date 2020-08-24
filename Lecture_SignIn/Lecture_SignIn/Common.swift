//
//  Common.swift
//  Lecture_SignIn
//
//  Created by 서보경 on 2020/03/19.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

// query string key=value&key=value
extension Dictionary {
    var queryString: String {
        var output = ""
        for (key, value) in self {
            output = output + "\(key)=\(value)&"
        }
        
        output = String(output.dropLast())
        return output
    }
}
