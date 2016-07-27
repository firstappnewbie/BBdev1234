//
//  LoginBB.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse
class LoginBB: UIViewController,FBSDKLoginButtonDelegate {
    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         FacebookLogin()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Facebook Api
    func FacebookLogin(){
        if (FBSDKAccessToken.currentAccessToken() == nil){
            print("Not login")
        }
        else{
            print("login")
        }
       
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        loginButton.center = CGPointMake(view.frame.size.width/2,view.frame.size.height/2 + 160)
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil{
            print("Login complete")
            let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.login()
            
        }else{
            print(error.localizedDescription)
        }
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("login")
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
}
