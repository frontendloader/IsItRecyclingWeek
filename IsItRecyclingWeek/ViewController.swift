//
//  ViewController.swift
//  IsItRecyclingWeek
//
//  Created by Ben on 4/20/16.
//  Copyright © 2016 Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appletonURLBase = "http://appletonapi.appspot.com/garbagecollection"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addressFieldChanged(sender: UITextField) {
        let addrStr: String = sender.text!
        let strLen: Int = (addrStr.characters.count)
        if(strLen > 4) {
            //do callout
            let urlStr = self.appletonURLBase + "?addr=" + "1928+S+LAWE+ST"
            let calloutURL = NSURL(string: urlStr)
            let task = NSURLSession.sharedSession().dataTaskWithURL(calloutURL!) {(data, response, error) in
                var jsonDict: Array<NSDictionary>!
                do {
                    jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as? Array<NSDictionary>
                } catch {
                    print(error)
                }
                print(jsonDict)
            }
            task.resume()
        }
    }
}

