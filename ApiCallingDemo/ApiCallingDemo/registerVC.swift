//
//  registerVC.swift
//  ApiCallingDemo
//
//  Created by Sharad Paghadal on 18/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit

class registerVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerBtnClicked(_ sender: Any) {
        var request = URLRequest(url: URL(string: "http://localhost/tempWebService/insert.php")!)
        request.httpMethod = "POST"
        let postString = "name=\(nameTextField.text!)&uname=\(userNameTextField.text!)&password=\(passwordTextField.text!)"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            if(error == nil){
                let jsonResult : NSDictionary
                do{
                    jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                }
                catch{
                    jsonResult = NSDictionary();
                }
                
                if (jsonResult != nil){
                    DispatchQueue.main.async(execute: {
                        let status = jsonResult.object(forKey: "status") as? String
                        if (status == "SUCCESS"){
                            print("User Inserted...")
                        }else{
                            print("Some Error")
                        }
                    })
                }else{
                    DispatchQueue.main.async(execute: {
                    })
                }
            }else{
                DispatchQueue.main.async(execute: {
                })
            }
        }).resume()
    }
    
}
