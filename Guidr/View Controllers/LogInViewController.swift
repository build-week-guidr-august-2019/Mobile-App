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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSignUpSegue" {
            guard let signupVC = segue.destination as? SignUpViewController else { return }
            signupVC.guideController = guideController
        }
    }
    
    @IBAction func toSignUpButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowSignUpSegue", sender: nil)
        //self.navigationController?.popViewController(animated: true)
        //     // TO DO: how can we go from here to the sign up screen?
               // I think we've corrected this and don't need the pop or dismiss
        //self.dismiss(animated: true, completion: nil)
    }
    

}
