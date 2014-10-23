//
//  ViewController.swift
//  Hello Time
//
//  Created by Michael Stewart on 10/22/14.
//  Copyright (c) 2014 iOS in Action. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.checkTime(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    func checkTime(sender: AnyObject) {
        var formatter = NSDateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("h:mm:ss a")
        self.timeLabel.text = formatter.stringFromDate(NSDate())
        delay(1.0) {
            self.checkTime(self)
            return
        }
        
    }

}

