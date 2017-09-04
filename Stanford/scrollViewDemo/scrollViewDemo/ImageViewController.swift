//
//  ImageViewController.swift
//  scrollViewDemo
//
//  Created by Sharad Paghadal on 16/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    var imageURL : String?{
        didSet{
            image = UIImage(named: imageURL!)
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 2.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image : UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
}
