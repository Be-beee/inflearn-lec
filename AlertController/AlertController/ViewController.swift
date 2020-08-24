//
//  ViewController.swift
//  AlertController
//
//  Created by 서보경 on 2020/03/10.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func displayAlert(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: "선택하세요", preferredStyle: .actionSheet)
//        let alert = UIAlertController(title: nil, message: "선택하세요", preferredStyle: .alert)

        
//        let delete = UIAlertAction(title: "삭제", style: .default, handler: nil)
        let ok = UIAlertAction(title: "확인", style: .default) { (action) in
            // 저장 버튼을 눌렀을 때 실행할 코드
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//        alert.addAction(delete)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)

    }
}

