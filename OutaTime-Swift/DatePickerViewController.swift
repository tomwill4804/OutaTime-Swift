//
//  DatePickerViewController.swift
//  OutaTime-Swift
//
//  Created by Tom Williamson on 5/12/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    var date : NSDate?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    @IBAction func returnDate(sender: AnyObject) {
        
        date = datePicker.date
        self.performSegueWithIdentifier("unwindDate", sender: self)
        
    }


}
