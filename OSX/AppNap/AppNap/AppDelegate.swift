//
//  AppDelegate.swift
//  AppNap
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

// ------
// app nap occlusion
// BEGIN app_nap_occlusion
    func applicationDidChangeOcclusionState(notification: NSNotification)
    {
        if (NSApp.occlusionState & NSApplicationOcclusionState.Visible != nil)
        {
            println("You are in the foreground, go nuts")
        }
        else
        {
            println("You are in the background, best slow down")
        }
    }
// END app_nap_occlusion
    
    func userActivitiesFunction()
    {
// ------
// App Nap user activites
// BEGIN app_nap_activity
        let queue = NSOperationQueue.mainQueue()
        
        var token = NSProcessInfo.processInfo()
        token.beginActivityWithOptions(NSActivityOptions.UserInitiated,
                                        reason: "Important stuff")
        
        queue.addOperationWithBlock { () -> Void in
            // do important stuff in here
        }
        NSProcessInfo.processInfo().endActivity(token)
// END app_nap_activity
    }

}

