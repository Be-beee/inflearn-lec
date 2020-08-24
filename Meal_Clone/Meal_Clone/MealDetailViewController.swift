//
//  MealDetailViewController.swift
//  Meal_Clone
//
//  Created by 서보경 on 2020/04/08.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

extension MealDetailViewController: RatingViewDelegate {
    func ratingStatusChanged() {
        saveButtonStatus()
    }
}

class MealDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var mealImageView: UIImageView!
    @IBOutlet var ratingView: RatingView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    var mealModel = MealModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        ratingView.delegate = self
        
        nameField.text = mealModel.name
        ratingView.rating = mealModel.rating
        mealImageView.image = mealModel.photo ?? UIImage(named: "defaultPhoto")
        saveButton.isEnabled = false
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(imageTap))
        mealImageView.addGestureRecognizer(tapGesture)
        mealImageView.isUserInteractionEnabled = true // 제스쳐 없는 오브젝트가 제스쳐 받을 수 있도록
    }
    
    @objc func imageTap() {
        print("image tap")
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            return
        }
        
        mealImageView.image = selectedImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func closeVC(_ sender: Any) {
        
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        
        
//        self.present
//        dismiss
        
        let presentingVC = presentingViewController is UINavigationController
        
        if presentingVC {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func didChanged(_ sender: UITextField) {
        saveButtonStatus()
        
    }
    
    func saveButtonStatus() {
        if nameField.text?.isEmpty ?? true{
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func saveMeal(_ sender: Any) {
        print("save Meal")
        
        mealModel.rating = ratingView.rating
        mealModel.name = nameField.text ?? ""
        mealModel.photo = mealImageView.image

        
        // model save
        
        self.performSegue(withIdentifier: "toMealList", sender: self)
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
