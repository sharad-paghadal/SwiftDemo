//
//  ViewController.swift
//  ApiCallingDemo
//
//  Created by Sharad Paghadal on 18/12/16.
//  Copyright © 2016 temp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uNameTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginBtnClicked(_ sender: Any) {
        var request = URLRequest(url: URL(string: "http://localhost/tempWebService/retrive.php")!)
        request.httpMethod = "POST"
        let postString = "uname=\(uNameTextField.text!)&password=\(passwordTextField.text!)"
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
                            print("User Login Success")
                            let data = jsonResult.object(forKey: "data") as! NSDictionary
                            let id = data.object(forKey: "id") as! String
                            let uname = data.object(forKey: "uName") as! String
                            let pass = data.object(forKey: "pass") as! String
                            let name = data.object(forKey: "name") as! String
                            
                            let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! detailVC
                            detail.id = id
                            detail.uname = uname
                            detail.name = name
                            detail.pass = pass
                            self.navigationController?.pushViewController(detail, animated: true)
                            
                        }else{
                            let msg = jsonResult.object(forKey: "status") as! String
                            let alert : UIAlertController = UIAlertController(title: "Error", message: "User Name or Password Wrong", preferredStyle: .actionSheet)
                            let alertOK : UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            alert.addAction(alertOK)
                            self.present(alert, animated: true)
                            print(msg)
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

