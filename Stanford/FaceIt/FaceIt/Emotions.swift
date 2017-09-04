//
//  emotionsViewController.swift
//  FaceIt
//
//  Created by Sharad Paghadal on 14/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class Emotions: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination
        
        if let faceView = destinationVC as? FaceViewController{
            
            if let identifier = segue.identifier{
                switch identifier{
                case "happy":
                    faceView.faceView?.smile = true
                case "normal":
                    faceView.faceView?.smile = true
                case "sad":
                    faceView.faceView?.smile = false
                default:
                    break
                }
            }
        }
    }
    
    
}
