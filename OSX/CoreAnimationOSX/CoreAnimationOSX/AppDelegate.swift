//
//  AppDelegate.swift
//  CoreAnimationOSX
//
//  Created by Timothy Rodney Nugent on 27/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import Cocoa
import QuartzCore

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var myView: NSView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        self.myView.layer?.backgroundColor = NSColor.redColor().CGColor
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }

    @IBAction func transaction(sender: AnyObject) {
        var myView = self.myView
// ------
// core animation on OS X
// BEGIN ca_osx
        // creating the animation
        var colorAnim = CABasicAnimation(keyPath: "backgroundColor")
        colorAnim.fromValue = NSColor.redColor().CGColor
        colorAnim.toValue = NSColor.greenColor().CGColor
        colorAnim.duration = 1.5
        
        // getting the views layer
        var layer = myView.layer!
        layer.addAnimation(colorAnim, forKey: "backgroundColor")
        
        // setting the final value after the animation
        layer.backgroundColor = NSColor.greenColor().CGColor
// END ca_osx
    }

}

