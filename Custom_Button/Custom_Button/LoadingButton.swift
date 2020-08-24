//
//  LoadingButton.swift
//  Custom_Button
//
//  Created by 서보경 on 2020/03/09.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class LoadingButton: UIButton {

    // activity indicator view
    
    private let indicator = UIActivityIndicatorView()
    //내부에서만 사용하는 프로퍼티의 경우 private 해주는게 조음 <- java랑 비슷하게
    
    private func makeIndicator() { //이 경우는 함수를 외부에서 사용하지 못하게 하는 게 좋다
        self.addSubview(indicator)
        //        indicator.style = .gray : iOS12
        
        DispatchQueue.main.async { // main thread에서 작동되도록 해야 함(다듬기1)
            self.indicator.isHidden = true
        }
        
        indicator.isUserInteractionEnabled = false //인디케이터가 액션을 못 먹도록(다듬기2)
        
        indicator.startAnimating()

        // code를 활용한 autolayout 사용
        indicator.translatesAutoresizingMaskIntoConstraints = false //코드를 활용한 오토레이아웃 사용시 필수
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // init
        
        makeIndicator()
    }
    
    public func startLoading() {
        
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(0), for: .normal) //인디케이터 활성화될 때 글자 안보이도록 (다듬기3)
        
        indicator.isHidden = false
    }
    
    public func stopLoading() {
        
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(1), for: .normal)
        
        indicator.isHidden = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
