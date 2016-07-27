//
//  SignUpVC.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//
import Parse
import UIKit

class SignUpVC: UIViewController ,UINavigationControllerDelegate{
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeatTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    var keyboard = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Sign Up
    @IBAction func signUpBtn(sender: AnyObject) {
        print("sign up press")
        //dissmiss keyboard
        self.view.endEditing(true)
        
        //check error input
        if (usernameTxt.text!.isEmpty || passwordTxt.text!.isEmpty || repeatTxt.text!.isEmpty ||
            emailTxt.text!.isEmpty){
            let alert = UIAlertController(title: "Please", message: "fill all field", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if passwordTxt.text != repeatTxt.text {
            let alert = UIAlertController(title: "PASSWORD", message: "do not match", preferredStyle: UIAlertControllerStyle.Alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil )
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
        }
            
        else{
            //add data to database
            let user = PFUser()
            user.username = usernameTxt.text?.lowercaseString
            user.email = emailTxt.text?.lowercaseString
            user.password = passwordTxt.text?.lowercaseString
            
            //register success
            user.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
                if success {
                    print("registered")
                    NSUserDefaults.standardUserDefaults().setObject(user.username, forKey: "username")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    //call login func
                    let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDelegate.login()
                    
                }
                else{
                    let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                    let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                    alert.addAction(ok)
                    self.presentViewController(alert, animated:true,completion: nil)
                }
            }
            
        }
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
