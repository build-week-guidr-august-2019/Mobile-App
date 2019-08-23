//
//  LandingPageNavViewController.swift
//  Guidr
//
//  Created by Stephanie Bowles on 8/23/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class LandingPageNavViewController: UINavigationController {
    
    var guideController: GuideController?

    override func viewDidLoad() {
        super.viewDidLoad()
        let landingPageVC = viewControllers.first as? LandingPageViewController
        landingPageVC?.guideController = guideController
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

}
