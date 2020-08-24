//
//  ViewController.swift
//  SearchBar
//
//  Created by 서보경 on 2020/03/14.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wordList = ["ali", "blue", "sky", "hello",
                    "number", "marvel", "super", "milk",
                    "fruit", "banana", "start", "end", "red",
                    "yellow", "gray", "친구", "사람", "사랑", "서울",
                    "한국", "비율", "거리", "바나나", "라면", "인천",
                    "경기도", "바다", "하늘", "휴식"]
    
    var filteredWordList: [String] = []
    var isFiltered = false
    
    @IBOutlet var searchResultTableView: UITableView!
    
    // cell 구성
    // 필터된 결과
    // 전체 결과
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        
        searchResultTableView.register(UINib(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell") // 외부에서 만든 셀 등록
        
        
        // search bar 등록
        let searchC = UISearchController(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        self.navigationItem.searchController = searchC
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch isFiltered {
        case true:
            return filteredWordList.count
        case false:
            return wordList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        
        switch isFiltered {
        case true:
            cell.wordLabel.text = filteredWordList[indexPath.row]
        case false:
            cell.wordLabel.text = wordList[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let hasText = searchController.searchBar.text?.lowercased() {
            if hasText.isEmpty {
                isFiltered = false
            } else {
                isFiltered = true
//                filteredWordList = wordList.filter({ (element) -> Bool in
//                    return element.contains(hasText)
//                })
                filteredWordList = wordList.filter{ $0.contains(hasText) }
            }
            searchResultTableView.reloadData()
        }
    }
    
    
}
