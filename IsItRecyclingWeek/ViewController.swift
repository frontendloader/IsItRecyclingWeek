//
//  ViewController.swift
//  IsItRecyclingWeek
//
//  Created by Ben on 4/20/16.
//  Copyright © 2016 Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dateFor: NSDateFormatter = NSDateFormatter()

    
    class CollectionDate {
        init(dict: NSDictionary) {
            collectionType = dict["collectionType"] as! String
            collectionDate = dict["collectionDate"] as! NSDate
        }
        var collectionType: String
        var collectionDate: NSDate
    }
    
    func deserializeResponse(JSONData: NSData) -> Array<NSDictionary> {
        var jsonDict: Array<NSDictionary>!
        do {
            jsonDict = try NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions()) as? Array<NSDictionary>
            
        } catch {
            
        }
        return jsonDict
    }
    
    func getCollectionDates(addrStr: String, callback: (result: String) -> Void) {
        let urlStr = self.appletonURLBase + "?addr=" + addrStr.stringByAddingPercentEncodingWithAllowedCharacters(.
            URLQueryAllowedCharacterSet())!
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
    
    let appletonURLBase = "http://appletonapi.appspot.com/garbagecollection"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dateFor.dateFormat = "yyyy-MM-dd"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePress(sender: UIBarButtonItem) {
        getCollectionDates(<#T##addrStr: String##String#>, callback: <#T##(result: String) -> Void#>)
    
    }
    

    
    
    @IBAction func addressFieldChanged(sender: UITextField) {
        let addrStr: String = sender.text!
        let strLen: Int = (addrStr.characters.count)
        if(strLen > 4) {
            /*do callout
            */
        }
    }
}

