//
//  ProductImg.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/22/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit
import Parse
import FBSDKCoreKit
import FBSDKLoginKit
class ProductImg: UIViewController {

    @IBOutlet weak var logout: UIBarButtonItem!
    @IBOutlet weak var ImgProduct: UIImageView!
    var imageArray = [String]()
    let loginManager = FBSDKLoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //query image from mongodb and show
        let query = PFQuery(className: "questions")
        query.whereKey("username", equalTo: PFUser.currentUser()!.username!)
        query.findObjectsInBackgroundWithBlock ({ (objects:[PFObject]?, error:NSError?) -> Void in
            for object in objects!{
                self.imageArray.append(object.valueForKey("imageurl") as! String)
            }
            if let url = NSURL(string: self.imageArray[0]) {
                if let data = NSData(contentsOfURL: url) {
                    self.ImgProduct.image = UIImage(data: data)
                }        
            }
            })
    }
    //logout facebook and parse
    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOutInBackgroundWithBlock { (error:NSError?) -> Void in
            NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            let signin = self.storyboard?.instantiateViewControllerWithIdentifier("LoginBB") as! LoginBB
            let appdelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appdelegate.window?.rootViewController = signin
            
        }
        loginManager.logOut()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
