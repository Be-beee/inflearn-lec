//
//  MealModel.swift
//  Meal_Clone
//
//  Created by 서보경 on 2020/04/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class MealModel: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    //to archive, class must implement NSCoding, NSObject
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(photo, forKey: "photo")
        coder.encode(rating, forKey: "rating")
    }
    
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let photo = coder.decodeObject(forKey: "photo") as? UIImage
        let rating = coder.decodeInteger(forKey: "rating")
        
        self.init(name: name, photo: photo, rating: rating)
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    override init() {
        self.name = ""
        self.rating = 0
    }
    init(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
    
}
