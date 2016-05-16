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
    
    //
    //  override set for speed variable
    //
    var speed : Int = 0 {
        didSet {
            speedLabel.text = String(speed) + " MPH"
        }
    }
    
    
    var dateFormatter : NSDateFormatter!
    var timer : NSTimer!

    //
    //  set initial values
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Time Circuits"
        dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        currentTimeLabel.text = dateFormatter.stringFromDate(NSDate())
        lastTimeLabel.text = "___ __ ____"
        
    }

    // MARK: - Navigation

    
    //
    //  back from date view
    //  see if we have a valid date to use
    //
    @IBAction func unwindDateController(segue:UIStoryboardSegue) {
        
        let tvc = segue.sourceViewController as! DatePickerViewController
        if tvc.date != nil {
           destinationTimeLabel.text = dateFormatter.stringFromDate(tvc.date!)
        }
        
        
    }
    
    
    //
    //  travel back button pushed
    //
    //  create a timer and start it
    //
    @IBAction func travelBackClicked(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                    target: self,
                                                    selector: #selector(updateTime),
                                                    userInfo: nil,
                                                    repeats: true)
        
    }
    
    
    //
    //  timer poped
    //
    //  update speed or stop
    //
    
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
