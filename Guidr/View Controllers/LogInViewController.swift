//
//  LogInViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var guideController: GuideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
//                        let alertController = UIAlertController(title: "Sign Up Successful", message: "Now please log in", preferredStyle: .alert)
//                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
//                            self.navigationController?.popViewController(animated: true)
//                        })
//
//                        alertController.addAction(alertAction)
//                        self.present(alertController, animated: true)
                        let userDefault = UserDefaults.standard
                        userDefault.set(true, forKey: "isLoggedIn")
                        userDefault.synchronize()
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    

    @IBAction func toSignUpButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        //     // TO DO: how can we go from here to the sign up screen?
        //        self.dismiss(animated: true, completion: nil)
    }
    

}
