//
//  ProfileViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/26/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var guideController: GuideController?
    var guide: Guide?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var taglineTextView: UITextView!
    @IBOutlet weak var guideAgeTextField: UITextField!
    @IBOutlet weak var yearsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {

        guard let name = nameTextField.text, !name.isEmpty,
            let tagline = taglineTextView.text, !tagline.isEmpty,
            let yearsAsGuide: Int = Int(yearsTextField.text!) ,
            let age: Int = Int(guideAgeTextField.text!)
        else { return }
        
        guideController?.putUser(name: name, age: age, tagline: tagline, yearsAsGuide: yearsAsGuide, completion: { (error) in
            if let error = error {
                NSLog("error creating new User: \(error)")}
        
            DispatchQueue.main.async {
                 self.dismiss(animated: true, completion: nil)
        }
    })
    }
    
    @IBAction func homeButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
   

//func updateViews() {
//    if gig != nil {
//        guard let gig = gig else { return }
//        jobTitleLabel.text = gig.title
//        datePicker.date = gig.dueDate
//        jobDescriptionField.text = gig.description
//        navigationItem.title = gig.title
//    } else {
//        navigationItem.title = "New Gig"
//    }
 
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
