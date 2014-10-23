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
    
    @IBOutlet weak var modeButton: UIButton!

    @IBAction func toggleMode(sender: AnyObject) {
        var halfish = 122.0/255.0
        var blue = UIColor(red: CGFloat(0), green: CGFloat(halfish), blue: CGFloat(1), alpha: CGFloat(1))
        var green = UIColor(red: CGFloat(0), green: CGFloat(1), blue: CGFloat(halfish), alpha: CGFloat(1))
        if (self.modeButton.titleLabel?.text == "Night") {
            self.view.backgroundColor = UIColor.blackColor()
            self.timeLabel.textColor = UIColor.whiteColor()
            self.modeButton.setTitle("Day", forState: UIControlState.Normal)
            self.modeButton.setTitleColor(green, forState: UIControlState.Normal)
            
        } else {
            self.view.backgroundColor = UIColor.whiteColor()
            self.timeLabel.textColor = UIColor.blackColor()
            self.modeButton.setTitle("Night", forState: UIControlState.Normal)
            self.modeButton.setTitleColor(blue, forState: UIControlState.Normal)

        }
    }
    
    
}

