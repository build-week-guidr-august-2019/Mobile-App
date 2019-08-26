//
//  PortfolioViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class PortfolioViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var guideAgeTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moreOptionsPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        let alertController = UIAlertController(title: "More Options...", message: nil, preferredStyle: .alert)
        
        // Create Options
        let editAction = UIAlertAction(title: "Edit", style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        // Add options (actions) to the list
        alertController.addAction(editAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
}
    
    func deleteTrip() {
        
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
