//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Timothy Rodney Nugent on 27/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
                            
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func stubMethodForSnippets()
    {
        let aView = UIView()
// ------
// accessing the layer property of a view
// BEGIN ca_layer
        // aView is an NSView or UIView
        var layer = aView.layer
// END ca_layer
    }

    @IBAction func animateWithDurationExample(sender: AnyObject)
    {
        var myView = self.myView
// ------
// basic animation
// BEGIN ca_basic
        UIView.animateWithDuration(0.25) { () -> Void in
            myView.center = CGPointMake(200, 200)
        }
    }
// END ca_basic
    
    @IBAction func animateWithKeyframeExample(sender: AnyObject) {
        var myView = self.myView
// ------
// BEGIN ca_keyframe
// an example of a keyframe animation
        UIView.animateKeyframesWithDuration(2.0, delay: 0.0,
            options: UIViewKeyframeAnimationOptions.LayoutSubviews,
            animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1,
                animations: { () -> Void in
                myView.center = CGPointMake(100, 100)
            })
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5,
                animations:
            { () -> Void in
                var rotation:CGFloat = CGFloat(45 * M_PI / 180.0)
                myView.transform = CGAffineTransformMakeRotation(rotation)
            })
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.5,
                animations:
            { () -> Void in
                myView.backgroundColor = UIColor.greenColor()
            })
            }, completion:
            { (finished:Bool) -> Void in
                // completion handler, in this case we are doing nothing
                println("Animation completed:\(finished)")
            })
// END ca_keyframe
    }
}

