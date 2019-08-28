//
//  CreateTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CreateTripViewController: UIViewController {
    
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var professionalView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            personalView.alpha = 1
            professionalView.alpha = 0
        } else {
            personalView.alpha = 0
            professionalView.alpha = 1
        }
    }
    
    
    
    @IBAction func saveTripButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    
    
    @IBAction func cancelTripButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
