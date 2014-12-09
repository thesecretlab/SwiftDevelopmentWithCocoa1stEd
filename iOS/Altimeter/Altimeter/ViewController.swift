//
//  ViewController.swift
//  Altimeter
//
//  Created by Jon Manning on 3/10/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var altitudeLabel: UILabel!
    
    // BEGIN altimeter_setup
    let altimeter = CMAltimeter()
    var currentAltitude : Float = 0.0
    // END altimeter_setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN altimeter_checking
        if CMAltimeter.isRelativeAltitudeAvailable() {
            println("Altimeter is available")
        } else {
            println("Altimeter is not available")
        }
        // END altimeter_checking
        
        // BEGIN altimeter_usage
        let mainQueue = NSOperationQueue.mainQueue()
    altimeter.startRelativeAltitudeUpdatesToQueue(mainQueue) { (data, error) in
        
            // data.relativeAltitude is the change in
            // altitude since the last time this closure
            // ran, measured in meters.
        
            // For example, you can keep track of the total
            // change in altitude, relative to where we started:
            self.currentAltitude += Float(data.relativeAltitude)
        
            self.altitudeLabel.text = "\(self.currentAltitude)m"
        }
        // END altimeter_usage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

