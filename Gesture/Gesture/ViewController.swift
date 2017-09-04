//
//  ViewController.swift
//  Gesture
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    @IBOutlet var rotateGesture: UIRotationGestureRecognizer!
    @IBOutlet weak var imgView: UIImageView!
    
    var minScale : CGFloat = 0
    var currentScale : CGFloat = 0
    var maxScale : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minScale = 0.7
        currentScale = 1.0
        maxScale = 2.0
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchFunc))
        imgView.addGestureRecognizer(pinchGesture)
        pinchGesture.delegate = self
        
        rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateFunc))
        imgView.addGestureRecognizer(rotateGesture)
        rotateGesture.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func pinchFunc(){
        //self.imgView.transform = self.imgView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        //pinchGesture.scale = 1.0
        
        if (currentScale * pinchGesture.scale > minScale) && (currentScale * pinchGesture.scale < maxScale)  {
            currentScale = currentScale * pinchGesture.scale
            self.imgView.transform = self.imgView.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        }
        pinchGesture.scale = 1.0
    }
    
    func rotateFunc(){
        self.imgView.transform = self.imgView.transform.rotated(by: rotateGesture.rotation)
        rotateGesture.rotation = 0.0
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

