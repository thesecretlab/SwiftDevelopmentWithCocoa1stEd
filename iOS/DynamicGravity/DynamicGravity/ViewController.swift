//
//  ViewController.swift
//  DynamicGravity
//
//  Created by Timothy Rodney Nugent on 27/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

// ------
// an example of adding gravity to a view
// BEGIN gui_dynamic_gravity
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var dynamicAnimator = UIDynamicAnimator()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dynamicAnimator =
                UIDynamicAnimator(referenceView: self.view)
        // creating and adding a gravity behavior
        let gravityBehavior = UIGravityBehavior(items: [self.imageView])
        dynamicAnimator.addBehavior(gravityBehavior)
            
        // creating and adding a collision behavior
        let collisionBehavior =
            UICollisionBehavior(items: [self.imageView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
    }
}
// END gui_dynamic_gravity
