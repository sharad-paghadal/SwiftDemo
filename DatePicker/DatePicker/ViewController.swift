//
//  ViewController.swift
//  DatePicker
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var dateTimeDisplay: UILabel!
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDateAndTime() {
        dateFormatter.dateStyle = DateFormatter.Style.full
        timeFormatter.timeStyle = DateFormatter.Style.full
        dateTimeDisplay.text = dateFormatter.string(from: datePicker.date) + " " + timeFormatter.string(from: timePicker.date)
    }
    
    @IBAction func datePickerChanged(_ sender: AnyObject) {
        setDateAndTime()
    }
    @IBAction func timePickerChanged(_ sender: AnyObject) {
        setDateAndTime()
    }

}

