//
//  ViewController.swift
//  Find_Cutie
//
//  Created by 서보경 on 2020/03/30.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    @IBOutlet var dinoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    
    
    // photo
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func showCamera(_ sender: UIBarButtonItem) {
        picker.sourceType = .camera
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func openPhotoLibrary(_ sender: UIBarButtonItem) {
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func processImage(_ image: UIImage) {
        // ML Model
        if let model = try? VNCoreMLModel(for: CutieClassifier().model) {
            
            
            let request = VNCoreMLRequest(model: model) { (request, error) in
                
                if let results = request.results as? [VNClassificationObservation] {
                    let firstValue = results.sorted (by: { (lh, rh) -> Bool in
                        return lh.confidence > rh.confidence // 내림차순
                        }).first
                    
                    if let bestMatch = firstValue {
                        self.nameLabel.text = bestMatch.identifier
                        self.percentLabel.text = "\(bestMatch.confidence) %"
                    }
                }
            }
            
            
            // image data
            if let imageData = image.jpegData(compressionQuality: 0.7) {
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
            
            
        } else {
            
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.dinoImageView.image = image
            self.processImage(image)
        }
        picker.dismiss(animated: true, completion: nil)
        
        
    }
}
