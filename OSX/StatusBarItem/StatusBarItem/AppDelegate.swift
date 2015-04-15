//
//  AppDelegate.swift
//  StatusBarItem
//
//  Created by Jon Manning on 23/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN statusitem
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!
    @IBOutlet var menu: NSMenu!
    
    var statusItem : NSStatusItem!

    @IBAction func quit(sender: AnyObject) {
        NSApplication.sharedApplication().terminate(nil)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        // BEGIN statusitem-explanation
        // Make a status bar that has variable length
        // (as opposed to being a standard square size)
        
        // -1 to indicate "variable length"
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
        
        // Set the text that appears in the menu bar
        statusItem.title = "My Item"
        
        // Set the menu that should appear when the item is clicked
        statusItem.menu = self.menu
        
        // Set if the item should change color when clicked
        statusItem.highlightMode = true
        // END statusitem-explanation
        
    }

}
// END statusitem

