//
//  RatingView.swift
//  Meal_Clone
//
//  Created by 서보경 on 2020/04/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

protocol RatingViewDelegate {
    func ratingStatusChanged()
}

class RatingView: UIStackView {
    
    var delegate: RatingViewDelegate?
    
    private var ratingButtons: [UIButton] = []
    public var rating = 0 {
        didSet{
            delegate?.ratingStatusChanged()
            updateButtonSelectionState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    private func setupButtons() {
        
        self.spacing = 10
        
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        let highlightedStar = UIImage(named: "highlightedStar")
        
        for index in 0 ..< 5 {
            
            let button = UIButton()
            
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            button.tag = index + 1
            button.addTarget(self, action: #selector(selectedStar), for: .touchUpInside)
            
            button.setImage(filledStar, for: .selected)
            button.setImage(emptyStar, for: .normal)
            button.setImage(highlightedStar, for: .highlighted)
            
            self.addArrangedSubview(button)
            ratingButtons.append(button)
            
        }
    }
    @objc func selectedStar(sender: UIButton) {
        print("select star \(sender.tag)")
        rating = sender.tag
    }
    
    func updateButtonSelectionState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < self.rating
            // 6-4 부터
            
            
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
