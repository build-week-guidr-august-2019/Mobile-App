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
    }
}
