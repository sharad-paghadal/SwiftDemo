//
//  CassiniViewController.swift
//  scrollViewDemo
//
//  Created by Sharad Paghadal on 18/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    private struct StoryBoard{
        static let ShowImageSegue = "Show Image"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.ShowImageSegue{
            if let ivc = segue.destination as? UINavigationController{
                let imageName = (sender as? UIButton)?.currentTitle
                if let ivcContain = ivc.visibleViewController as? ImageViewController{
                    ivcContain.imageURL = imageName
                    ivcContain.title = imageName
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self{
            if let ivc = secondaryViewController.contentViewController as? ImageViewController, ivc.imageURL == nil{
               return true
            }
        }
        return false
    }
}

extension UIViewController {
    var contentViewController : UIViewController{
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }else{
            return self
        }
    }
}
