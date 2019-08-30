//
//  CreateTripViewController.swift
//  Guidr
//
//  Created by Jessie Ann Griffin on 8/24/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

protocol createTripDelegate {
    func tripWasCreated(_ trip: Trip)
}

class CreateTripViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateOfTripTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var personalButton: UIButton!
    @IBOutlet weak var professionalButton: UIButton!
    
    
    var delegate: createTripDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalButton.isSelected = true
        
        titleTextField.delegate = self
        descriptionTextField.delegate = self
        dateOfTripTextField.delegate = self
        durationTextField.delegate = self
        difficultyTextField.delegate = self
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
    
        guard let title = titleTextField.text, !title.isEmpty,
            let description = descriptionTextField.text, !description.isEmpty,
            let date = dateOfTripTextField.text, !date.isEmpty,
            let duration = durationTextField.text, !duration.isEmpty,
            let difficulty = difficultyTextField.text, !difficulty.isEmpty else { return }

//        delegate?.tripWasCreated(trip)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelTripButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func toggleTripType() {
        personalButton.isSelected.toggle()
        professionalButton.isSelected.toggle()
    }

}

extension CreateTripViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case titleTextField:
                descriptionTextField.becomeFirstResponder()
            case descriptionTextField:
                dateOfTripTextField.becomeFirstResponder()
            case dateOfTripTextField:
                durationTextField.becomeFirstResponder()
            case durationTextField:
                difficultyTextField.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
