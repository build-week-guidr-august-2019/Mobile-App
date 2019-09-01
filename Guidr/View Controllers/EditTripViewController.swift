//
//  EditTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class EditTripViewController: UIViewController {

    
    @IBOutlet weak var tripTitleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    //@IBOutlet weak var difficultyTextField: UILabel!
    
    @IBOutlet weak var tripImageView: UIImageView!
    
    var guideController: GuideController?
    var trip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func uploadPhotoButtonPressed(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let title = tripTitleTextField.text,
            let description = descriptionTextView.text,
            let date = dateTextField.text,
            let duration: Int =  Int(durationTextField.text!) else { return }
        
        //should this be putTrip instead of createTrip?
        guideController?.createTrip(title: title, shortDescription: description, duration: duration, date: date, completion: { (_) in
            print("Message created!")
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        })
        
    }
}
