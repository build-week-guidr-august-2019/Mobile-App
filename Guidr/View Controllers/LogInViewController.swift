//
//  LogInViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var guideController: GuideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSignUpSegue" {
            guard let signupVC = segue.destination as? SignUpViewController else { return }
            signupVC.guideController = guideController
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let guideController = self.guideController else {return}
        
        if let username = self.usernameTextField.text,
            !username.isEmpty,
            let password = self.passwordTextField.text, !password.isEmpty {
            let user = User(username: username, password: password)
            
            guideController.logIn(with: user) { (error) in
                if let error = error {
                    NSLog("Error occured during log in: \(error)")
                } else {
                    DispatchQueue.main.async {
//                        let userDefault = UserDefaults.standard
//                        userDefault.set(true, forKey: "isLoggedIn")
//                        userDefault.synchronize()
                        self.dismiss(animated: true, completion: nil)
//                        self.navigationController?.popToRootViewController(animated: true )
                    }
                }
            }
        }
    }
    
    @IBAction func toSignUpButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowSignUpSegue", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
