//
//  ViewController.swift
//  SplitView
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    var selectedIndex:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberLabel?.text = "\(selectedIndex)"
        
        // add back button to the navigation bar.
        
        if splitViewController?.responds(to : #selector(getter: UISplitViewController.displayModeButtonItem)) == true {
            navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
            navigationItem.leftItemsSupplementBackButton = true
        }

        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
}

