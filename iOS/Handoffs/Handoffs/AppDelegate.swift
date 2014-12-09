//
//  AppDelegate.swift
//  Handoffs
//
//  Created by Jon Manning on 3/10/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // BEGIN handoffs_continue_activity
    func application(application: UIApplication,
                     continueUserActivity userActivity: NSUserActivity,
                     restorationHandler: ([AnyObject]!) -> Void) -> Bool {
            
        // Any objects we pass to the restorationHandler function will
        // have restoreUserActivityState called on them, in which they'll
        // get data out of the activity and make themselves ready for the
        // user to resume the activity
        
        // In this example, we only have a single view controller, 
        // so pass that in
        
        if let rootViewController = self.window?.rootViewController {
            
            restorationHandler([rootViewController])
            
            return true
        } else {
            return false
        }
        
    }
    // END handoffs_continue_activity


}

