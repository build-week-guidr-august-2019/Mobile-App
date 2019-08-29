//
//  SignUpViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var guideController: GuideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        guard let guideController = self.guideController else {return}
        
        if let username = self.usernameTextField.text,
        !username.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty {
            let user = User(username: username, password: password)
            
            guideController.signUp(with: user) { (error) in
                if let error = error {
                    NSLog("Error occured during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                            //self.navigationController?.popViewController(animated: true)
                            self.performSegue(withIdentifier: "ShowLogInSegue", sender: nil)
                        })
                        
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true)
                }
             }
          }
       }
    }
    
    
    @IBAction func toLoginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowLogInSegue", sender: nil)
        //self.navigationController?.popToRootViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
        
        //SEGUES need to be wired properly or this flow needs rethinking
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ShowLogInSegue" {
             guard let loginVC = segue.destination as? LogInViewController else {return}
             loginVC.guideController = guideController
         }
     }
}
