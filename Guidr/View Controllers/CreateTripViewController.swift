//
//  CreateTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit



class CreateTripViewController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateOfTripTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func switchViews(_ sender: Any) {
        if segment.selectedSegmentIndex == 0 {
            
        } else {
            
        }
    }
    
    
    @IBAction func uploadPhotoButtonPressed(_ sender: UIButton) {
    }
    
    
    
    @IBAction func saveTripButtonTapped(_ sender: UIBarButtonItem) {
    
        
    
    }
    
    @IBAction func cancelTripButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}


