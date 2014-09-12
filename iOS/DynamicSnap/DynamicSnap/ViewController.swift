//
//  ViewController.swift
//  DynamicSnap
//
//  Created by Timothy Rodney Nugent on 27/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

// ------
// showing the dynamic snap behaviour
// BEGIN gui_dynamic_snap
import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var imageView: UIImageView!
    
    var dynamicAnimator:UIDynamicAnimator?
    var snap:UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    }
    
    @IBAction func tapped(sender: AnyObject) {
        // getting the tap location
        let tap = sender as UITapGestureRecognizer
        let point = tap.locationInView(self.view)
        
        // removing the previous snapping and adding the new one
        self.dynamicAnimator?.removeBehavior(self.snap)
        self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
        self.dynamicAnimator?.addBehavior(self.snap)
    }
}
// END gui_dynamic_snap
