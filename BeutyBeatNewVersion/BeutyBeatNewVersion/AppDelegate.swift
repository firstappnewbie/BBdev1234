//
//  AppDelegate.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Parse
import Bolts
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //Connecting to parse
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let parseConfiguration = ParseClientConfiguration(block: { (ParseMutableClientConfiguration) -> Void in
            ParseMutableClientConfiguration.applicationId = "BBDev2d4f3a"
            ParseMutableClientConfiguration.clientKey = "uedfqasd211"
            //Deploy to heroku server
            ParseMutableClientConfiguration.server = "https://desolate-fortress-42430.herokuapp.com/parse"
        })
        
        Parse.initializeWithConfiguration(parseConfiguration)
        //Set Pagecontroller
        let pageController =   UIPageControl.appearance()
        pageController.backgroundColor = UIColor.whiteColor()
        pageController.currentPageIndicatorTintColor = UIColor.blackColor()
        pageController.pageIndicatorTintColor = UIColor.lightGrayColor()
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    //Change Storyboard 
    func login(){
        let username : String? = NSUserDefaults.standardUserDefaults().stringForKey("username")
        
        if username != nil{
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let QuestionMC = storyboard.instantiateViewControllerWithIdentifier("QuestionMC") 
            window?.rootViewController = QuestionMC
        }

    }
}

