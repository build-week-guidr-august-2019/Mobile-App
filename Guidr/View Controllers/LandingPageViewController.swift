//
//  LandingPageViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/22/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    // MARK: Properties
    var guideController: GuideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SignUp" {
            if let signupVC = segue.destination as? SignUpViewController {
                signupVC.guideController = guideController
            }
        } else if segue.identifier == "LogIn" {
            guard let loginVC = segue.destination as? LogInViewController else {return}
            loginVC.guideController = guideController
        }
    }
    
    func assignbackground() {
        let background = UIImage(named: "landingPageImage")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}
