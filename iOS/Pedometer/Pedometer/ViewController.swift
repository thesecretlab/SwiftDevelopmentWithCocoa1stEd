//
//  ViewController.swift
//  Pedometer
//
//  Created by Jon Manning on 3/10/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var stepsSinceLastDayLabel: UILabel!
    
    @IBOutlet weak var stepsSinceAppStartLabel: UILabel!
    
    // BEGIN pedometer_setup
    let pedometer = CMPedometer()
    // END pedometer_setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN pedometer_checking
        if CMPedometer.isStepCountingAvailable() {
            println("Pedometer is available")
        } else {
            println("Pedometer is not available")
        }
        // END pedometer_checking
        
        // BEGIN pedometer_query
        
        // Create NSDate objects that refer to 1. right now
        // and 2. one day ago
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let oneDayAgo = calendar.dateByAddingUnit(NSCalendarUnit.DayCalendarUnit,
                                                  value: -1,
                                                  toDate: now,
                                                  options: NSCalendarOptions())
        
        // Ask the pedometer to give us info about that date range
        pedometer.queryPedometerDataFromDate(oneDayAgo, toDate: now) {
            (pedometerData, error) in
            
            // This closure is called on a background queue,
            // so run any changes to the GUI on the main queue
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                if let data = pedometerData {
                
                    self.stepsSinceLastDayLabel.text =
                        "\(data.numberOfSteps) steps"
                    
                }
            }
        }
        // END pedometer_query
        
        // BEGIN pedometer_live_updates
        // Start getting live updates on step count, starting from now
        pedometer.startPedometerUpdatesFromDate(now) { (pedometerData, error)  in
            
            if let data = pedometerData {
                
                // Run the update on the background
                NSOperationQueue.mainQueue().addOperationWithBlock() {
                    
                    self.stepsSinceAppStartLabel.text =
                        "\(data.numberOfSteps) steps"
                    
                }
            }
        }
        // END pedometer_live_updates
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

