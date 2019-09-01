//
//  CreateTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit



class CreateTripViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateOfTripTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!  // there's nothing on backend for difficulty
    @IBOutlet weak var image: UIImageView!
    
    var guideController: GuideController?
    var trip: Trip?

//        didSet {
//            DispatchQueue.main.async {
//                self.updateViews()
//            }
//        }
//    }

    @IBOutlet weak var personalButton: UIButton!
    @IBOutlet weak var professionalButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    
    
    @IBAction func personalButtonPressed(_ sender: UIButton) {
        toggleTripType()
    }
    
    @IBAction func professionalButtonPressed(_ sender: UIButton) {
        toggleTripType()
    }
    
    @IBAction func uploadPhotoButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func saveTripButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text,
            let description = descriptionTextField.text,
            let date = dateOfTripTextField.text,
            let duration: Int =  Int(durationTextField.text!) else { return }
    
        
        guideController?.createTrip(title: title, shortDescription: description, duration: duration, date: date, completion: { (_) in
            print("Message created!")
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
        
     
    }
    @IBAction func saveTrip(_ sender: Any) {
//        guard let title = titleTextField.text,
//            let description = descriptionTextField.text,
//            let date = dateOfTripTextField.text,
//            let duration: Int =  Int(durationTextField.text!) else { return }
//        
//        
//        guideController?.createTrip(title: title, shortDescription: description, duration: duration, date: date, completion: { (_) in
//            print("Message created!")
//            DispatchQueue.main.async {
//                self.navigationController?.popViewController(animated: true)
//            }
//        })
    }
    
    @IBAction func cancelTripButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func toggleTripType() {
        personalButton.isSelected.toggle()
        professionalButton.isSelected.toggle()
    }

}


