//
//  ViewController.swift
//  Motion
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

// ------
// motion setup
// BEGIN motion_setup
import UIKit
import CoreMotion

class ViewController: UIViewController {
                            
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
// END motion_setup
    
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
// ------
// motion func
// BEGIN motion_func
    override func viewDidAppear(animated: Bool) {
        self.motionManager.startDeviceMotionUpdatesToQueue(
            NSOperationQueue.mainQueue(),
            withHandler: { (motion: CMDeviceMotion!, error: NSError!) -> Void in
                let xString = NSString(format:"%.1f", motion.userAcceleration.x)
                let yString = NSString(format:"%.1f", motion.userAcceleration.y)
                let zString = NSString(format:"%.1f", motion.userAcceleration.z)
                
                self.xLabel.text = xString
                self.yLabel.text = yString
                self.zLabel.text = zString
                
                //convert the pitch, yaw and roll to degrees
                let pitchDegrees = motion.attitude.pitch * 180 / M_PI
                let yawDegress = motion.attitude.yaw * 180 / M_PI
                let rollDegress = motion.attitude.roll * 180 / M_PI
                
                let pitchString = NSString(format: "%.1f", pitchDegrees)
                let yawString = NSString(format: "%.1f", yawDegress)
                let rollString = NSString(format: "%.1f", rollDegress)
                
                self.pitchLabel.text = pitchString
                self.yawLabel.text = yawString
                self.rollLabel.text = rollString
        })
    }
// END motion_func

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

