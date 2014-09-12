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
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        // creating and adding a gravity behaviour
        let gravityBehaviour = UIGravityBehavior(items: [self.imageView])
        self.dynamicAnimator.addBehavior(gravityBehaviour)
        
        // creating and adding a collision behaviour
        let collisionBehaviour = UICollisionBehavior(items: [self.imageView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        self.dynamicAnimator.addBehavior(collisionBehaviour)
    }
}
// END gui_dynamic_gravity
