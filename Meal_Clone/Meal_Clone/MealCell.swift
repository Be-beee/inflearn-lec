//
//  MealCell.swift
//  Meal_Clone
//
//  Created by 서보경 on 2020/04/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var ratingView: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
