//
//  ViewController.swift
//  Meal_Clone
//
//  Created by 서보경 on 2020/04/02.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mealList: [MealModel] = []

    @IBOutlet var mealTableView: UITableView!
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {

        guard let detailVC = sender.source as? MealDetailViewController else {
            return
        }
        
        if let selectedIndexPath = self.mealTableView.indexPathForSelectedRow {
            mealList[selectedIndexPath.row] = detailVC.mealModel
            self.mealTableView.reloadRows(at: [selectedIndexPath], with: .none)
            // reload하면서 셀렉트된 것도 없어짐
        } else {
            let insertIndexPath = IndexPath(row: mealList.count, section: 0)
            mealList.append(detailVC.mealModel)
            self.mealTableView.insertRows(at: [insertIndexPath], with: .automatic)
            
            
//            self.mealTableView.reloadData() -> 전체 갱신해도 됨
        }
        
        saveMeals()
    }
    
    func saveMeals() {
        // archive
        
        // path
        
        DispatchQueue.global().async {
    // myFolder/meal
            let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
            
            guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else {
                return
            }
            
    //        let isSuccessSave = NSKeyedArchiver.archiveRootObject(mealList, toFile: archiveURL.path)
            
            do {
                let archivedData = try NSKeyedArchiver.archivedData(withRootObject: self.mealList, requiringSecureCoding: true)
                try archivedData.write(to: archiveURL)

            } catch {
                print(error)
            }
            
            
    //        if isSuccessSave {
    //            print("save successed")
    //        } else {
    //            print("save failed")
    //        }
        }
        
        
        
    }
    
    
    func loadMeals() -> [MealModel]? {
        let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
        
        guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else {
            return nil
        }
        
        guard let codedData = try? Data(contentsOf: archiveURL) else {
            return nil
        }
        
        guard let unarchivedData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData) else {
            return nil
        }
        return unarchivedData as? [MealModel]
        
//        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [MealModel]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedMeals = loadMeals() {
            self.mealList = loadedMeals
        }
        
        if mealList.count == 0 {
            let dummy1 = MealModel.init(name: "스파게티", photo: UIImage(named: "meal1"), rating: 3)
            let dummy2 = MealModel.init(name: "케밥", photo: UIImage(named: "meal2"), rating: 5)
            let dummy3 = MealModel.init(name: "파스타", photo: UIImage(named: "meal3"), rating: 2)

            
            mealList.append(dummy1)
            mealList.append(dummy2)
            mealList.append(dummy3)
        }
        
        

        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentDetail" {
            
        } else if segue.identifier == "showDetail" {
            let detailVC = segue.destination as! MealDetailViewController
            
            let selectedCell = sender as! MealCell
            if let selectedIndexPath = mealTableView.indexPath(for: selectedCell) {
                detailVC.mealModel = mealList[selectedIndexPath.row]
            }
            
        }
    }

    
    var isEditMode = false
    
    @IBAction func doEdit(_ sender: Any) {
        isEditMode = !isEditMode
        mealTableView.setEditing(isEditMode, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mealList.remove(at: indexPath.row)
            mealTableView.deleteRows(at: [indexPath], with: .automatic)
            saveMeals()
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mealCell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealCell
        mealCell.name.text = mealList[indexPath.row].name
        mealCell.ratingView.rating = mealList[indexPath.row].rating
        mealCell.mealImageView.image = mealList[indexPath.row].photo ?? UIImage(named: "defaultPhoto")
        
        return mealCell
    }
    
    
}
