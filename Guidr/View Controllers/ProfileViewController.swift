//
//  ProfileViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var taglineTextView: UITextView!
    @IBOutlet weak var guideAgeTextField: UITextField!
    @IBOutlet weak var yearsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func homeButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
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
