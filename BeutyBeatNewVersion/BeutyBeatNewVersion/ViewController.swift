//
//  ViewController.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UIPageViewControllerDataSource{
    
    @IBOutlet weak var Enter: UIButton!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    var pageviewcontroller :UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupPage()
        pageView()
        animateBtn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    //Setup image
    func SetupPage(){
        self.pageTitles = NSArray(objects: "1","2","3","4","5")
        self.pageImages = NSArray(objects: "1","2","3","4","5")
        self.Enter.layer.borderColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).CGColor;
        self.Enter.layer.borderWidth = CGFloat(Float(0.7));
            }
    //Setup pageview
    func pageView(){
        self.pageviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageviewcontroller.dataSource = self
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageviewcontroller.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        self.pageviewcontroller.view.frame = CGRectMake(0,0, self.view.frame.width, self.view.frame.height - 55)
        self.addChildViewController(self.pageviewcontroller)
        self.view.addSubview(self.pageviewcontroller.view)

    }
    func viewControllerAtIndex(index: Int) ->ContentViewController{
        if((self.pageTitles.count == 0) || (index >= self.pageTitles.count)){
            return ContentViewController()
        }
        let vc :ContentViewController  = self.storyboard?.instantiateViewControllerWithIdentifier("Contentview") as! ContentViewController
        vc.imageFile = self.pageImages[index] as! String
        //vc.titleText = self.pageTitles[index] as! String
        //vc.Button = self
        vc.pageIndex = index
        return vc
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if(index==0 || index == NSNotFound)
        {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if(index == NSNotFound)
        {
            return nil
        }
        index += 1
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    //Animate Button
    func animateBtn(){
        UIView.animateWithDuration(1, delay: 0.0, options: [], animations: {
            
            //display background image
            self.Enter.alpha = 0
          
                      }, completion:nil)
        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            
            //display button
            self.Enter.center.y -= 7
            self.Enter.alpha = 0.9
            }, completion:{ _ in
                
                
        })

    }
        
    
}

