//
//  ViewController.swift
//  FaceIt
//
//  Created by Sharad Paghadal on 12/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    
    @IBOutlet weak var faceView: FaceView!{
        didSet{
            let recogniser = UITapGestureRecognizer(target: faceView, action: #selector(faceView.tapHandle(_:)))
            faceView.addGestureRecognizer(recogniser)
            
            let rec = UIPinchGestureRecognizer(target: faceView, action: #selector(faceView.pinchHandle(_:)))
            faceView.addGestureRecognizer(rec)
        }
    }
}

