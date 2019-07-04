//
//  ViewController.swift
//  ServerCommunication_GET Approach
//
//  Created by Alivelu Ravula on 4/19/18.
//  Copyright © 2018 Roja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var URLSessionObj: URLSession?
    var URLReq: URLRequest?
    var dataTask: URLSessionDataTask?
    
    @IBAction func topPaidBtnTap(_ sender: Any) {
        
    self.URLSessionObj = URLSession(configuration: .default)
    self.URLReq = URLRequest(url: URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json")!)
    self.dataTask = self.URLSessionObj?.dataTask(with: self.URLReq!, completionHandler: { (data, resp, error) in
            
            print(data)
        do{
            var dict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
//            print(dict)
            var feedDict : [String:Any] = dict["feed"] as! [String:Any]
//            print(feedDict)
            var resultsArr : [[String:Any]]  = feedDict["results"] as! [[String:Any]]
//            print(resultsArr)
            
            for i in 0..<resultsArr.count
            {
            var appDict : [String:Any]  = resultsArr[i]
                print(appDict["name"]!)
            }
            
        }
        catch{
            print("something")
        }
        
        })
        
        self.dataTask?.resume()
        
        let topFreeTVC = self.storyboard?.instantiateViewController(withIdentifier: "TopFreeTableVC")
        self.navigationController?.pushViewController(topFreeTVC!, animated: true)
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

