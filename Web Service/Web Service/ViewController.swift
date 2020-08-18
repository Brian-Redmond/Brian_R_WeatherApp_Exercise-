//
//  ViewController.swift
//  Web Service
//
//  Created by Brian Redmond on 8/18/20.
//  Copyright © 2020 Brian Redmond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
                  if let data = NSData(contentsOf: url as URL){
                      do {
                      let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                          let newDict = parsed
                        
                          print(newDict["currently"]!["summary"] as Any)
                          print(newDict["currently"]!["temperature"] as Any)
                          print(newDict["currently"]!["dewPoint"]as Any)
                          
                        self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                        self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                        self.currentDewPoint.text = "\(newDict["currently"]!["dewPoint"]!!)"
                    }
                    catch let error as NSError {
                    print("A JSON parsithng error occurred, here are the details:\n \(error)")
        // Do any additional setup after loading the view.
    }
                    


}

}
}

    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentSummary: UILabel!
    @IBOutlet var currentDewPoint: UILabel!
  

}
