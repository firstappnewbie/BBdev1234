//
//  ContentViewController.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    var pageIndex:Int!
    var imageFile:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ImageView.image = UIImage(named: self.imageFile)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
