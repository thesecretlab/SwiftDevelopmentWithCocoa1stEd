//
//  ViewController.swift
//  Handoffs
//
//  Created by Jon Manning on 3/10/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

// Conforming to NSUserActivityDelegate means we get notified
// of important things happening to the activity
// BEGIN handoffs_delegate_protocol
class ViewController: UIViewController, NSUserActivityDelegate {
// END handoffs_delegate_protocol
    
    // Our activity:
    
    // BEGIN handoffs_activity
    var activity : NSUserActivity?
    // END handoffs_activity

    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    
    
    // BEGIN handoffs_save
    // A switch has changed state, so we need to update activity
        @IBAction func switchUpdated(sender: UISwitch) {
            self.activity?.needsSave = true
        }
    // END handoffs_save
    
    // BEGIN handoffs_willsave
    // Called at some point after you set needsSave on the activity to true
        func userActivityWillSave(userActivity: NSUserActivity) {
            userActivity.userInfo = activityInfoDictionary()
        }
    // END handoffs_willsave
    
    // BEGIN handoffs_restore_state
    // Called by the system when we need to 
    // restore from an incoming activity
    override func restoreUserActivityState(activity: NSUserActivity) {
        
        if activity.activityType == "com.oreilly.Handoffs.switches" {
            let userInfo = activity.userInfo as! [String : Bool]
            
            switch1.on = userInfo["switch1"] as Bool!
            switch2.on = userInfo["switch2"] as Bool!
            switch3.on = userInfo["switch3"] as Bool!
        }        
    }
    // END handoffs_restore_state
    
    // BEGIN handoffs_info_dict
    // Creates and returns a dictionary containing the state of the activity
        func activityInfoDictionary() -> [String: Bool] {
            return [
                "switch1": switch1.on,
                "switch2": switch2.on,
                "switch3": switch3.on
            ]
        }
    // END handoffs_info_dict
    
    // BEGIN handoffs_view_will_appear
    override func viewWillAppear(animated: Bool) {
            // When the view appears, create and set up the activity
            activity =
                NSUserActivity(activityType: "com.oreilly.Handoffs.switches")
            activity?.userInfo = activityInfoDictionary()
            activity?.title = "Switches"
            activity?.delegate = self
            
            // Becoming current means that this activity will be broadcast
            // to all other nearby devices that have the same iCloud account
            activity?.becomeCurrent()
        }
    // END handoffs_view_will_appear
    
    // BEGIN handoffs_view_will_disappear
    override func viewWillDisappear(animated: Bool) {
            // When the view disappears, turn off the activity
            activity?.invalidate()
            activity = nil
        }
    // END handoffs_view_will_disappear
    
}

