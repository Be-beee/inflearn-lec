//
//  DetailViewController.swift
//  QuickGuide
//
//  Created by 서보경 on 2020/03/07.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func awakeFromNib() { //화면 연결 시점에 호출
        super.awakeFromNib()
        print("awakeFromNib") // optional, once
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad") // once

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    
    //viewDidDisappear, deinit -> 화면 종료 이후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    deinit { //호출 안 될 경우 메모리 누수 문제 가능성있음 체크해봐야됨
        print("deinit")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
