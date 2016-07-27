//
//  SignInVC.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/19/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit
import Parse
class signInVC: UIViewController{
    
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInBtn_click(sender: AnyObject) {
        
        usernametxt.autocorrectionType = .No
        passwordtxt.autocorrectionType = .No
        self.view.endEditing(true)
        //Check error
        if usernametxt.text!.isEmpty || passwordtxt.text!.isEmpty {
            let alert = UIAlertController(title: "Please", message: "fill in fields", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated:true,completion: nil)
        }
        //Parse login
        PFUser.logInWithUsernameInBackground(usernametxt.text!, password: passwordtxt.text!) { (user:PFUser?, error:NSError?) -> Void in
            
            if error == nil {
                NSUserDefaults.standardUserDefaults().setObject(user!.username, forKey: "username")
                NSUserDefaults.standardUserDefaults().synchronize()
                
                let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.login()
                
            }
            else {
                
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated:true,completion: nil)
                
            }
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
