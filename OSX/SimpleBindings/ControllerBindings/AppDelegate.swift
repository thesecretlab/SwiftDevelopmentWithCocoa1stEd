//
//  AppDelegate.swift
//  ControllerBindings
//
//  Created by Jon Manning on 7/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!

    // BEGIN notes_array
    // An empty array of Note objects
    var notes = [Note]()
    // END notes_array

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

