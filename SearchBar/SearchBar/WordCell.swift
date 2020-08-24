//
//  WordCell.swift
//  SearchBar
//
//  Created by 서보경 on 2020/03/14.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class WordCell: UITableViewCell {

    @IBOutlet var wordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
