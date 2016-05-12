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
    
    var speed = 0;
    var dateFormatter : NSDateFormatter!
    
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
        
        
    }

}
