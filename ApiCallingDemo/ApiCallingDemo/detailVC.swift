//
//  detailVC.swift
//  ApiCallingDemo
//
//  Created by Sharad Paghadal on 18/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit

class detailVC: UIViewController {
    
    var id : String = ""
    var name : String = ""
    var uname : String = ""
    var pass : String = ""

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idLabel.text = id
        nameLabel.text = name
        userNameLabel.text = uname
        passwordLabel.text = pass

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
