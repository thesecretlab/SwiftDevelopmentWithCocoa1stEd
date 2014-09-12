//
//  AppDelegate.swift
//  OSXSharing
//
//  Created by Jon Manning on 24/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!
    @IBOutlet var textView: NSTextField!
    @IBOutlet var imageView: NSImageView!

    @IBAction func shareText(sender: NSControl) {
        var share = NSSharingServicePicker(items: [self.textView.stringValue])
        
        // NOTE TO AUTHORS AND PROD: preferredEdge should be an NSRectEdge, but that appears to not exist??
        share.showRelativeToRect(sender.bounds, ofView: self.textView, preferredEdge: 2)
    }

    @IBAction func shareImage(sender: NSControl) {
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

