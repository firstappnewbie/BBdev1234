//
//  QuestionMC.swift
//  BeutyBeatNewVersion
//
//  Created by 3arthzneiz on 7/18/2559 BE.
//  Copyright © 2559 3arthzneiz. All rights reserved.
//

import UIKit
import Parse
class QuestionMC: UIViewController {
    
    @IBOutlet weak var LabelTxt: UILabel!
    @IBOutlet weak var BTN1: UIButton!
    @IBOutlet weak var BTN2: UIButton!
    @IBOutlet weak var BTN3: UIButton!
    @IBOutlet weak var BTN4: UIButton!
    @IBOutlet weak var BTN5: UIButton!
    @IBOutlet weak var BTN6: UIButton!
    @IBOutlet weak var Confirm: UIButton!
    @IBOutlet weak var NEXT: UIButton!
    var Question=0
    var counter=0
    var counter2=0
    var counter3=0
    var counter4=0
    var counter5=0
    var counter6=0
    var Dry=0
    var Oily=0
    var Normal=0
    var Acne=0
    var HD=0
    var CoverageLevel=0
    var Sensitive=0
    var Consistency=0
    var FinishType=0
    var SPF=0
    var AntiAge=0
    var LongLast=0
    var Cruelty=0
    var Vegan=0
    var myArray : [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //Setup Question
    func setup(){
        BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
        BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
        BTN3.setBackgroundImage(UIImage(named: "btn3.png"), forState: UIControlState.Normal)
        BTN4.setBackgroundImage(UIImage(named: "btn4.png"), forState: UIControlState.Normal)
        BTN5.setBackgroundImage(UIImage(named: "btn5.png"), forState: UIControlState.Normal)
        BTN6.setBackgroundImage(UIImage(named: "btn6.png"), forState: UIControlState.Normal)
        Question = Question + 1
        switch Question {
        case 1:
            LabelTxt.text="How do you like your foundation?"
            BTN1.setTitle("Liquid", forState: UIControlState.Normal)
            BTN2.setTitle("Cream", forState: UIControlState.Normal)
            BTN3.setTitle("Powder", forState: UIControlState.Normal)
            BTN4.setTitle("Mousse", forState: UIControlState.Normal)
            BTN5.hidden = true
            BTN6.hidden = true
            
            break
        case 2:
            LabelTxt.text="What kind of finish would you like your foundation to have?"
            BTN1.setTitle("Natural", forState: UIControlState.Normal)
            BTN2.setTitle("Matte", forState: UIControlState.Normal)
            BTN3.setTitle("Dewy", forState: UIControlState.Normal)
            BTN4.setTitle("Radiant", forState: UIControlState.Normal)
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 3:
            LabelTxt.text="What’s your skin type?"
            BTN1.setTitle("Dry", forState: UIControlState.Normal)
            BTN2.setTitle("Oily", forState: UIControlState.Normal)
            BTN3.setTitle("Normal", forState: UIControlState.Normal)
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 4:
            LabelTxt.text="Do you have super sensitive skin?"
            BTN1.setTitle("Yes/No", forState: UIControlState.Normal)
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 5:
            LabelTxt.text="What kind of coverage are looking for from your foundation?"
            BTN1.setTitle("Low", forState: UIControlState.Normal)
            BTN2.setTitle("Low-Medium", forState: UIControlState.Normal)
            BTN3.setTitle("Low-High", forState: UIControlState.Normal)
            BTN4.setTitle("Medium", forState: UIControlState.Normal)
            BTN5.setTitle("Medium-High", forState: UIControlState.Normal)
            BTN6.setTitle("High", forState: UIControlState.Normal)
            BTN1.hidden = false
            BTN2.hidden = false
            BTN3.hidden = false
            BTN4.hidden = false
            BTN5.hidden = false
            BTN6.hidden = false
            break
        case 6:
            LabelTxt.text="Do you look for SPF in your foundation?"
            BTN1.setTitle("Yes/No", forState: UIControlState.Normal)
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 7:
            LabelTxt.text="Do you look for anti-aging benefits in your foundation?"
            BTN1.setTitle("Yes/No", forState: UIControlState.Normal)
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 8:
            LabelTxt.text="What are your main beauty concerns?"
            BTN1.setTitle("Acne", forState: UIControlState.Normal)
            BTN2.setTitle("HD", forState: UIControlState.Normal)
            BTN2.hidden = false
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 9:
            LabelTxt.text="Are you looking for foundation that will last all day?"
            BTN1.setTitle("Yes/No", forState: UIControlState.Normal)
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        case 10:
            LabelTxt.text="Do you prefer vegan friendly/cruelty free products?"
            BTN1.setTitle("Yes/No", forState: UIControlState.Normal)
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            break
        default:
            break
        }
        
        
    }
    func sendrequest(x: [Int]){
        myArray.append(Consistency)
        myArray.append(FinishType)
        myArray.append(Normal)
        myArray.append(Dry)
        myArray.append(Oily)
        myArray.append(Sensitive)
        myArray.append(CoverageLevel)
        myArray.append(SPF)
        myArray.append(AntiAge)
        myArray.append(Acne)
        myArray.append(HD)
        myArray.append(LongLast)
        myArray.append(Cruelty)
        myArray.append(Vegan)
        //Deploy python to heroku
        let url : String = "https://rocky-harbor-60926.herokuapp.com/login?Consistency=\(x[0])&FinishType=\(x[1])&Normal=\(x[2])&Dry=\(x[3])&Oily=\(x[4])&Sensitive=\(x[5])&CoverageLevel=\(x[6])&SPF=\(x[7])&AntiAge=\(x[8])&Acne=\(x[9])&HD=\(x[10])&LongLast=\(x[11])&Cruelty=\(x[12])&Vegan=\(x[13])"
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        //Get Result from algorithm in Flask server
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            let error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            
            let jsonResult: NSArray! = try! NSJSONSerialization.JSONObjectWithData(data!, options:[]) as? NSArray
            print(jsonResult)
            //Result info return product
            let info : NSArray =  jsonResult.valueForKey("imageURL") as! NSArray
            print("-------------------------")
            print(info[0])
            if (jsonResult != nil) {
                // process jsonResult
                let object = PFObject(className: "questions")
                object["username"] = PFUser.currentUser()!.username
                object["imageurl"] = info[0]
                object.saveInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
                    
                    if error == nil {
                        print("----------------------++++++")
                        NSNotificationCenter.defaultCenter().postNotificationName("uploaded", object: nil)
                    }
                }
                //switch Page
                self.Switchview()
            } else {
                // couldn't load JSON, look at error
                print("errror")
            }
        })
        // return
    }
    //Keep data from each question
    @IBAction func Choice1(sender: AnyObject) {
        
        if Question == 1{
            counter += 1
            
            if counter == 0 {
                Consistency = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
               
            }
            else if counter == 1 && ( counter2 == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
            && counter6 == 0){
                Consistency = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
                 print(counter)
            }
            else if counter == 1 && ( counter2 == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter = 0
            }
        }
        if Question == 2{
            counter += 1
            if counter == 0 {
                FinishType = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1 && ( counter2 == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                FinishType = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            else if counter == 1 && ( counter2 == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter = 0
            }
        }
        if Question == 3{
            counter += 1
            if counter == 0{
                Dry = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
            }
            else if counter == 1{
                Dry = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
        }
        if Question == 4{
            counter += 1
            if counter == 0{
                Sensitive = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1{
                Sensitive = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        if Question == 5{
            counter += 1
            if counter == 0 {
                CoverageLevel = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1 && ( counter2 == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                CoverageLevel = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            else if counter == 1 && ( counter2 == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter = 0
            }
            
        }
        if Question == 6{
            counter += 1
            if counter == 0{
                SPF = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1{
                SPF = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        if Question == 7{
            counter += 1
            if counter == 0{
                AntiAge = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1{
                AntiAge = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        if Question == 8{
            counter += 1
            if counter == 0{
                Acne = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1{
                Acne = 1
                     BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        if Question == 9{
            counter += 1
            if counter == 0{
                LongLast = 0
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
            }
            else if counter == 1{
                LongLast = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        if Question == 10{
            counter += 1
            if counter == 0{
                Cruelty = 1
                Vegan = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1.png"), forState: UIControlState.Normal)
                
            }
            else if counter == 1{
                Cruelty = 1
                Vegan = 1
                BTN1.setBackgroundImage(UIImage(named: "btn1click.png"), forState: UIControlState.Normal)
                counter = -1
            }
            
        }
        
        
    }
    
    @IBAction func Choice2(sender: AnyObject) {
        if Question == 1{
            counter2 += 1
            if counter2 == 0{
                Consistency = 0
                BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
                
            }
            else if counter2 == 1 && (counter == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                Consistency = 1
                BTN2.setBackgroundImage(UIImage(named: "btn2click.png"), forState: UIControlState.Normal)
                counter2 = -1
            }
            else if counter2 == 1 && (counter == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter2 = 0
                print(counter2)
                
            }
        }
        if Question == 2{
            counter2 += 1
            if counter2 == 0 {
                FinishType = 0
                BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
                
            }
            else if counter2 == 1 && ( counter == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                FinishType = 1
                BTN2.setBackgroundImage(UIImage(named: "btn2click.png"), forState: UIControlState.Normal)
                counter2 = -1
            }
            else if counter2 == 1 && ( counter == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter2 = 0
            }
        }
        if Question == 3{
            counter2 += 1
            if counter2 == 0{
                Oily = 0
                BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
                
            }
            else if counter2 == 1{
                Oily = 1
                BTN2.setBackgroundImage(UIImage(named: "btn2click.png"), forState: UIControlState.Normal)
                counter2 = -1
            }
        }
        if Question == 5{
            counter2 += 1
            if counter2 == 0 {
                CoverageLevel = 0
                BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
                
            }
            else if counter2 == 1 && ( counter == 0 && counter3 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                CoverageLevel = 1
                BTN2.setBackgroundImage(UIImage(named: "btn2click.png"), forState: UIControlState.Normal)
                counter2 = -1
            }
            else if counter2 == 1 && ( counter == -1 || counter3 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter2 = 0
            }
        }
        if Question == 8{
            counter2 += 1
            if counter2 == 0{
                HD = 0
                BTN2.setBackgroundImage(UIImage(named: "btn2.png"), forState: UIControlState.Normal)
                
            }
            else if counter2 == 1{
                HD = 1
                BTN2.setBackgroundImage(UIImage(named: "btn2click.png"), forState: UIControlState.Normal)
                counter2 = -1
            }
        }
        
    }
    @IBAction func Choice3(sender: AnyObject) {
        if Question == 1{
            counter3 += 1
            if counter3 == 0 {
                Consistency = 0
                BTN3.setBackgroundImage(UIImage(named: "btn3.png"), forState: UIControlState.Normal)
                
            }
            else if counter3 == 1 && ( counter2 == 0 && counter == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                Consistency = 2
                BTN3.setBackgroundImage(UIImage(named: "btn3click.png"), forState: UIControlState.Normal)
                counter3 = -1
            }
            else if counter3 == 1 && ( counter == -1 || counter2 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1){
                counter3 = 0
            }
        
        }
        if Question == 2{
            counter3 += 1
            if counter3 == 0 {
                FinishType = 0
                BTN3.setBackgroundImage(UIImage(named: "btn3.png"), forState: UIControlState.Normal)
                
            }
            else if counter3 == 1 && ( counter == 0 && counter2 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                FinishType = 2
                BTN3.setBackgroundImage(UIImage(named: "btn3click.png"), forState: UIControlState.Normal)
                counter3 = -1
            }
            else if counter3 == 1 && ( counter == -1 || counter2 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter3 = 0
            }
        }
        if Question == 3{
            counter3 += 1
            if counter3 == 0{
                Normal = 0
                BTN3.setBackgroundImage(UIImage(named: "btn3.png"), forState: UIControlState.Normal)
                
            }
            else if counter3 == 1{
                Normal = 1
                BTN3.setBackgroundImage(UIImage(named: "btn3click.png"), forState: UIControlState.Normal)
                counter3 = -1
            }
        }
        if Question == 5{
            counter3 += 1
            if counter3 == 0 {
                CoverageLevel = 0
                BTN3.setBackgroundImage(UIImage(named: "btn3.png"), forState: UIControlState.Normal)
                
            }
            else if counter3 == 1 && ( counter == 0 && counter2 == 0 && counter4 == 0 && counter5 == 0
                && counter6 == 0){
                CoverageLevel = 2
                BTN3.setBackgroundImage(UIImage(named: "btn3click.png"), forState: UIControlState.Normal)
                counter3 = -1
            }
            else if counter3 == 1 && ( counter == -1 || counter2 == -1 || counter4 == -1 || counter5 == -1 || counter6 == -1) {
                counter3 = 0
            }

        }
    }
    
    
    @IBAction func Choice4(sender: AnyObject) {
        
        if Question == 1{
            counter4 += 1
            if counter4 == 0 {
                Consistency = 0
                BTN4.setBackgroundImage(UIImage(named: "btn4.png"), forState: UIControlState.Normal)
                
            }
            else if counter4 == 1 && counter2 == 0 && counter3 == 0 && counter == 0 && counter5 == 0
                && counter6 == 0{
                Consistency = 3
                BTN4.setBackgroundImage(UIImage(named: "btn4click.png"), forState: UIControlState.Normal)
                counter4 = -1
            }
            else if counter4 == 1 && ( counter2 == -1 || counter3 == -1 || counter == -1 || counter5 == -1 || counter6 == -1) {
                counter4 = 0
            }

 
        }
        if Question == 2{
            counter4 += 1
            if counter4 == 0 {
                FinishType = 0
                BTN4.setBackgroundImage(UIImage(named: "btn4.png"), forState: UIControlState.Normal)
                
            }
            else if counter4 == 1 && ( counter == 0 && counter3 == 0 && counter2 == 0 && counter5 == 0
                && counter6 == 0){
                FinishType = 3
                BTN4.setBackgroundImage(UIImage(named: "btn4click.png"), forState: UIControlState.Normal)
                counter4 = -1
            }
            else if counter4 == 1 && ( counter == -1 || counter3 == -1 || counter2 == -1 || counter5 == -1 || counter6 == -1) {
                counter4 = 0
            }
        }
        if Question == 3{
            BTN4.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            counter2 += 1
            if counter2 == 0{
                FinishType = 0
                BTN4.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                
            }
            else if counter2 == 1{
                FinishType = 0
                BTN4.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
                counter2 = -1
            }
        }
        if Question == 5 {
            counter4 += 1
            if counter4 == 0 {
                CoverageLevel = 0
                BTN4.setBackgroundImage(UIImage(named: "btn4.png"), forState: UIControlState.Normal)
                
            }
            else if counter4 == 1 && ( counter == 0 && counter3 == 0 && counter2 == 0 && counter5 == 0
                && counter6 == 0){
                CoverageLevel = 3
                BTN4.setBackgroundImage(UIImage(named: "btn4click.png"), forState: UIControlState.Normal)
                counter4 = -1
            }
            else if counter4 == 1 && ( counter == -1 || counter3 == -1 || counter2 == -1 || counter5 == -1 || counter6 == -1) {
                counter4 = 0
            }
        }
    }
    @IBAction func Choice5(sender: AnyObject) {
        if Question == 3{
            BTN5.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            
            counter2 += 1
            if counter2 == 0{
                CoverageLevel = 0
                BTN5.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                
            }
            else if counter2 == 1{
                CoverageLevel = 0
                BTN5.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
                counter2 = -1
            }
        }
        if Question == 5{
            counter5 += 1
            if counter5 == 0 {
                CoverageLevel = 0
                BTN5.setBackgroundImage(UIImage(named: "btn5.png"), forState: UIControlState.Normal)
                
            }
            else if counter5 == 1 && ( counter == 0 && counter3 == 0 && counter2 == 0 && counter4 == 0
                && counter6 == 0){
                CoverageLevel = 4
                BTN5.setBackgroundImage(UIImage(named: "btn5click.png"), forState: UIControlState.Normal)
                counter4 = -1
            }
            else if counter5 == 1 && ( counter == -1 || counter3 == -1 || counter2 == -1 || counter4 == -1 || counter6 == -1) {
                counter5 = 0
            }

        }
        
    }
    @IBAction func Choice6(sender: AnyObject) {
        if Question == 3{
            BTN6.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            counter2 += 1
            if counter2 == 0{
                FinishType = 0
                BTN6.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
                
            }
            else if counter2 == 1{
                FinishType = 0
                BTN6.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
                counter2 = -1
            }
        }
        if Question == 5{
            counter6 += 1
            if counter6 == 0 {
                CoverageLevel = 0
                BTN6.setBackgroundImage(UIImage(named: "btn6.png"), forState: UIControlState.Normal)
                
            }
            else if counter6 == 1 && ( counter == 0 && counter3 == 0 && counter2 == 0 && counter4 == 0
                && counter5 == 0){
                CoverageLevel = 5
                BTN6.setBackgroundImage(UIImage(named: "btn6click.png"), forState: UIControlState.Normal)
                counter6 = -1
            }
            else if counter6 == 1 && ( counter == -1 || counter3 == -1 || counter2 == -1 || counter4 == -1 || counter5 == -1) {
                counter6 = 0
            }
            
        }
        
    }
    //Default
    @IBAction func next(sender: AnyObject) {
        setup()
        counter = 0
        counter2 = 0
        counter3 = 0
        counter4 = 0
        counter5 = 0
        counter6 = 0
        //Send request to server
        if Question == 11{
            LabelTxt.hidden = true
            BTN1.hidden = true
            BTN2.hidden = true
            BTN3.hidden = true
            BTN4.hidden = true
            BTN5.hidden = true
            BTN6.hidden = true
            myArray.append(Consistency)
            myArray.append(FinishType)
            myArray.append(Normal)
            myArray.append(Dry)
            myArray.append(Oily)
            myArray.append(Sensitive)
            myArray.append(CoverageLevel)
            myArray.append(SPF)
            myArray.append(AntiAge)
            myArray.append(Acne)
            myArray.append(HD)
            myArray.append(LongLast)
            myArray.append(Cruelty)
            myArray.append(Vegan)
            sendrequest(myArray)
            
        }
    }
    //Change view
    func Switchview(){
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("ProductImg")
        self.showViewController(vc as! UIViewController, sender: vc)
    }

}
