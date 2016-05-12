//
//  TimeCircuitsViewController.swift
//  OutaTime-Swift
//
//  Created by Tom Williamson on 5/12/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    var speed : Int = 0 {
        didSet {
            speedLabel.text = String(speed) + " MPH"
            
        }
    }
    
    
    var dateFormatter : NSDateFormatter!
    var timer : NSTimer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Time Circuits"
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        currentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
        lastTimeLabel.text = "___ __ ____"
        
    }

    // MARK: - Navigation

    
    @IBAction func unwindDateController(segue:UIStoryboardSegue) {
        
        let tvc = segue.sourceViewController as! DatePickerViewController
        if tvc.date != nil {
           destinationTimeLabel.text = dateFormatter.stringFromDate(tvc.date)
        }
        
        
    }
    
    
    @IBAction func travelBackClicked(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                    target: self,
                                                    selector: #selector(self.updateTime),
                                                    userInfo: nil,
                                                    repeats: true)
        
        
    }
    
    func updateTime() {
        
        if speed < 88 {
            speed += 1
        }
        else {
            
            timer.invalidate()
            lastTimeLabel.text = currentTimeLabel.text;
            currentTimeLabel.text = destinationTimeLabel.text;
            speed = 0;
            
        }
        
        
    }

}
