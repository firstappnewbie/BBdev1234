//
//  NavBar.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/24/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit

class NavBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationBar.tintColor = .whiteColor()
        self.navigationBar.barTintColor = UIColor(red: 46.0/255.0, green: 179.0/255.0, blue: 90.0/255.0, alpha: 1)
        self.navigationBar.translucent = false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
