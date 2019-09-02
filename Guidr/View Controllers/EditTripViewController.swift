//
//  EditTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class EditTripViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tripTitleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UILabel!
    
    @IBOutlet weak var tripImageView: UIImageView!
    
    var guideController: GuideController?
    var trip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func uploadPhotoButtonPressed(_ sender: UIButton) {
    }
    
    // MARK: - Navigation
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let title = tripTitleTextField.text,
            let description = descriptionTextView.text,
            let date = dateTextField.text,
            let duration: Int =  Int(durationTextField.text!),
            let trip = trip else { return }

        guideController?.putTrip(trip: trip, title: title, shortDescription: description, duration: duration, date: date, completion: { (error) in
            if let error = error {
                NSLog("error creating new User: \(error)")}
            
            DispatchQueue.main.async {
                print("Guide created!")
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
}
